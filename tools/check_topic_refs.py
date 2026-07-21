#!/usr/bin/env python3
"""Guard the [Topic N] cross-reference convention.

Topic cross-references are written as autorefs shorthands, `[Topic N][topic-N]`,
resolved by mkdocs-autorefs against a stable `[](){ #topic-N }` anchor emitted
before each Topic heading in Annex 2.02 (see the annex-2.02 jinja template).

This is a fast, build-independent static check with two jobs:

  1. Every referenced identifier has an anchor. A `[Topic N][topic-N]` whose
     `topic-N` has no matching `[](){ #topic-N }` anchor would render as the
     literal text `[Topic N][topic-N]` on the site. The strict MkDocs build and
     check_doc_links.py also catch this at build time (via the autorefs
     "Could not find cross-reference target" warning); this check restates it
     with a Topic-specific message and without needing a build.

  2. No inline Topic links remain. A `[Topic N](...)` inline link resolves, so no
     build gate flags it, but it bypasses the autorefs convention and reintroduces
     the per-use hard-coded anchor this refactor removed. This check is the only
     thing that keeps that from creeping back.

  3. No same-page `[text](#slug)` links in the split main document (docs/main/).
     The chapters reference sections with autorefs ([text][slug]) so a reference
     to another chapter resolves across pages; a `[text](#slug)` fragment link
     resolves only within its own page and silently breaks across chapters.

Run:  python3 tools/check_topic_refs.py     (exit 1 on any violation)

Anchors are read from the generated Annex 2.02, so run `make hltr` first if the
CSV changed (CI does).
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
ANCHORS_FILE = ROOT / "docs" / "annexes" / "annex-2" / "annex-2.02-high-level-requirements-by-topic.md"

# Files that use Topic references. The generated annex-2.02/2.03 are derived from
# the CSV, so checking the CSV covers them at source.
SOURCES = [
    ROOT / "hltr" / "high-level-requirements.csv",
    *sorted((ROOT / "docs" / "main").glob("*.md")),
    *sorted((ROOT / "docs" / "discussion-topics").glob("*.md")),
]

ANCHOR_RE = re.compile(r"\[\]\(\)\{\s*#topic-(\d+)\s*\}")
REF_RE = re.compile(r"\[Topic (\d+)\]\[topic-(\d+)\]")
INLINE_RE = re.compile(r"\[Topic \d+\]\(")
# Same-page fragment links in the split main document. The chapters use
# mkdocs-autorefs ([text][slug]) for every section cross-reference, so that a
# reference to another chapter resolves across pages. A [text](#slug) fragment
# link resolves only within its own page and silently breaks when the target is
# in a different chapter, so it must not reappear.
MAIN_DIR = ROOT / "docs" / "main"
FRAGMENT_RE = re.compile(r"\]\(#[^)]")


def defined_anchors() -> set[str]:
    text = ANCHORS_FILE.read_text(encoding="utf-8")
    return {m.group(1) for m in ANCHOR_RE.finditer(text)}


def rel(path: pathlib.Path) -> str:
    return str(path.relative_to(ROOT))


def main() -> int:
    anchors = defined_anchors()
    if not anchors:
        print(
            f"error: no #topic-N anchors found in {rel(ANCHORS_FILE)}; "
            "run `make hltr` first.",
            file=sys.stderr,
        )
        return 1

    dangling: list[str] = []   # referenced topic with no anchor
    mismatched: list[str] = []  # [Topic N][topic-M] with N != M
    inline: list[str] = []      # inline [Topic N](...) links
    fragment: list[str] = []    # [text](#slug) same-page link in a split chapter

    for path in SOURCES:
        if not path.exists():
            continue
        is_main_chapter = MAIN_DIR in path.parents
        for lineno, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            for m in REF_RE.finditer(line):
                display, ident = m.group(1), m.group(2)
                if display != ident:
                    mismatched.append(f"{rel(path)}:{lineno}: [Topic {display}][topic-{ident}] — display and identifier disagree")
                elif ident not in anchors:
                    dangling.append(f"{rel(path)}:{lineno}: [Topic {ident}][topic-{ident}] — no #topic-{ident} anchor in Annex 2.02")
            if INLINE_RE.search(line):
                inline.append(f"{rel(path)}:{lineno}: inline Topic link — use the reference form [Topic N][topic-N] instead")
            if is_main_chapter and FRAGMENT_RE.search(line):
                fragment.append(f"{rel(path)}:{lineno}: same-page [text](#slug) link — use the cross-page reference form [text][slug] instead")

    problems = dangling + mismatched + inline + fragment
    if problems:
        print("Topic reference check failed:", file=sys.stderr)
        for p in problems:
            print(f"  - {p}", file=sys.stderr)
        print(
            f"\n{len(dangling)} dangling, {len(mismatched)} mismatched, "
            f"{len(inline)} inline link(s), {len(fragment)} same-page fragment link(s). "
            "Fix these before merging.",
            file=sys.stderr,
        )
        return 1

    refs = sum(len(REF_RE.findall(p.read_text(encoding="utf-8"))) for p in SOURCES if p.exists())
    print(f"OK: {refs} [Topic N][topic-N] references, all resolve to one of "
          f"{len(anchors)} anchors; no inline Topic links; "
          "no same-page fragment links in split chapters.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
