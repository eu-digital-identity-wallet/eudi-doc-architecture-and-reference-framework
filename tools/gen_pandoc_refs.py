#!/usr/bin/env python3
"""Generate includes/pandoc-refs.md: pandoc link reference definitions for the
internal-anchor shorthands the PDF build would otherwise leave unresolved.

The website resolves [Topic N][topic-N] (and, after the main-document split,
[Section X][slug]) with mkdocs-autorefs. pandoc does not know autorefs: a
[text][identifier] with no reference definition renders as the literal text
"[text][identifier]" in the PDF. This file supplies those definitions so the
combined PDF resolves them as internal links (\\hyperref).

It complements includes/references.md, which already holds the external
[shorthand]: url definitions and is pandoc-compatible as-is; the Makefile appends
both files to every pandoc invocation (PANDOC_REFS).

Emits link reference definitions for the identifiers mkdocs-autorefs resolves on
the website but pandoc cannot:
  - [topic-N]: #topic-N     for every Topic anchor in Annex 2.02.
  - [slug]: #slug           for every main-document section heading/anchor.
  - [id]: #id               for the Annex 3 rulebook anchors (Annex 3 is part of
                            the combined PDF, so these resolve internally).
  - [id]: <published URL>   for the Technical Specification anchors (the TS
                            documents are not part of the combined PDF, so these
                            resolve to the live site instead of an internal anchor).

Run after `make hltr` (the Topic anchors live in the generated Annex 2.02):
    python3 tools/gen_pandoc_refs.py
"""
import pathlib
import re
import unicodedata

ROOT = pathlib.Path(__file__).resolve().parent.parent
ANNEX2 = ROOT / "docs" / "annexes" / "annex-2" / "annex-2.02-high-level-requirements-by-topic.md"
MAIN_DIR = ROOT / "docs" / "main"
OUT = ROOT / "includes" / "pandoc-refs.md"
ANNEX3_DIR = ROOT / "docs" / "annexes" / "annex-3"
TS_DIR = ROOT / "docs" / "technical-specifications"
# Published base URL for Technical Specification pages. TS documents are not part
# of the combined PDF, so their cross-references resolve to the live site.
TS_BASE_URL = "https://eudi.dev/latest/technical-specifications"

ANCHOR_RE = re.compile(r"\[\]\(\)\{\s*#(topic-\d+)\s*\}")
# Section headings and explicit markdown anchors in the split main document.
HEADING_RE = re.compile(r"(?m)^#{1,6}\s+(.*?)\s*$")
EXPLICIT_ANCHOR_RE = re.compile(r"\[\]\(\)\{\s*#([\w-]+)\s*\}")
# attr_list id on a heading: "### 3.1 Introduction { #roles-introduction }".
# When present it overrides the heading's text slug, so it is the anchor to emit.
HEADING_ATTR_RE = re.compile(r"\{\s*#([\w-]+)\s*\}\s*$")


def slugify(text: str) -> str:
    """Reproduce the anchor Python-Markdown's toc extension assigns to a heading
    (the same slug mkdocs uses, and the identifier the [text][slug] refs carry)."""
    v = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode("ascii")
    v = re.sub(r"[^\w\s-]", "", v).strip().lower()
    return re.sub(r"[\s]+", "-", v)


def section_defs() -> list[str]:
    """[slug]: #slug for every main-document heading and explicit anchor, so the
    combined PDF resolves the [text][slug] section cross-references that
    mkdocs-autorefs resolves on the website. Deduplicated; the referenced slugs
    are unique (checked by tools/check_topic_refs.py / the split), so each maps to
    the intended heading."""
    slugs: set[str] = set()
    for f in sorted(MAIN_DIR.glob("*.md")):
        text = f.read_text(encoding="utf-8")
        slugs.update(EXPLICIT_ANCHOR_RE.findall(text))
        for h in HEADING_RE.findall(text):
            attr = HEADING_ATTR_RE.search(h)
            if attr:                       # explicit id overrides the text slug
                slugs.add(attr.group(1))
            elif slugify(h):
                slugs.add(slugify(h))
    return [f"[{s}]: #{s}" for s in sorted(slugs)]


def heading_anchor_ids(path: pathlib.Path) -> list[str]:
    """Explicit `{ #id }` ids on the headings of a file, in document order."""
    ids: list[str] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        if re.match(r"^#{1,6}\s", line):
            m = HEADING_ATTR_RE.search(line)
            if m:
                ids.append(m.group(1))
    return ids


def annex3_defs() -> list[str]:
    """[id]: #id for the explicit anchors in the Annex 3 rulebooks. Annex 3 is part
    of the combined PDF (SOURCE_DOCS includes annex-[1235]), so these resolve as
    internal links, exactly like the main-document section anchors."""
    defs: list[str] = []
    for f in sorted(ANNEX3_DIR.glob("*.md")):
        for i in heading_anchor_ids(f):
            defs.append(f"[{i}]: #{i}")
    return defs


def ts_defs() -> list[str]:
    """[id]: <published URL> for the explicit anchors in the Technical Specification
    documents. These are not part of the combined PDF, so — unlike main-document or
    rulebook anchors — they resolve to the published site page, not an internal PDF
    anchor."""
    defs: list[str] = []
    for f in sorted(TS_DIR.glob("*.md")):
        for i in heading_anchor_ids(f):
            defs.append(f"[{i}]: {TS_BASE_URL}/{f.stem}/")
    return defs


def main() -> None:
    ids = sorted(
        {m.group(1) for m in ANCHOR_RE.finditer(ANNEX2.read_text(encoding="utf-8"))},
        key=lambda s: int(s.split("-")[1]),
    )
    lines = [
        "<!-- Auto-generated by tools/gen_pandoc_refs.py. Do not edit by hand.",
        "     pandoc link reference definitions for internal-anchor shorthands",
        "     ([Topic N][topic-N] and [Section X][slug]) that mkdocs-autorefs",
        "     resolves on the website but pandoc cannot. Appended to the combined",
        "     PDF build via PANDOC_REFS_INTERNAL (Makefile). -->",
        "",
        "<!-- Topic anchors (Annex 2.02). -->",
    ]
    lines += [f"[{i}]: #{i}" for i in ids]
    sections = section_defs()
    lines += ["", "<!-- Main-document section anchors. -->", *sections]
    rulebooks = annex3_defs()
    lines += ["", "<!-- Annex-3 rulebook anchors (part of the combined PDF). -->",
              *rulebooks]
    ts = ts_defs()
    lines += ["", "<!-- Technical Specification anchors (published URLs; the TS "
              "documents are not part of the combined PDF). -->", *ts]
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {len(ids)} Topic, {len(sections)} section, {len(rulebooks)} rulebook "
          f"and {len(ts)} Technical Specification anchor definitions "
          f"to {OUT.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
