#!/usr/bin/env python3
"""Generate includes/references.md from the reference tables in
Section 10 of the ARF main document.

The output file contains Markdown reference-link definitions for every
item listed in the reference tables (e.g. [European Digital Identity
Regulation], [ISO/IEC 18013-5], [CIR 2024/2977]). It is auto-appended
to every page at build time via pymdownx.snippets, so that shorthand
references like "[OpenID4VCI]" render as links across the whole site.

Run after any change to the reference tables:
    python3 tools/gen_references.py
"""
import re
import pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
MAIN = ROOT / "docs" / "main" / "10-references.md"
OUT = ROOT / "includes" / "references.md"

ROW = re.compile(r"^\|\s*\[([^\]]+)\]\s*\|\s*(.+?)\s*\|\s*$", re.M)
LINK = re.compile(r"\[([^\]]*)\]\(<?([^)>\s]+)>?\)")
BARE = re.compile(r"https?://\S+")


def main() -> None:
    text = MAIN.read_text(encoding="utf-8")
    defs: dict[str, tuple[str, str]] = {}
    for label, desc in ROW.findall(text):
        link = LINK.search(desc)
        if link:
            url = link.group(2)
        else:
            bare = BARE.search(desc)
            if not bare:
                continue
            url = bare.group(0).rstrip("|).,")
        title = LINK.sub(r"\1", desc)
        title = re.sub(r"[*_`|]", "", title).strip()
        if len(title) > 160:
            # Cut on a word boundary: a mid-word cut produces non-words such as
            # "Artic" (from "Article"), which the spell-check step rejects.
            title = title[:160].rsplit(" ", 1)[0].rstrip(" ,;:-")
        title = title.replace('"', "'")
        defs[label] = (url, title)

    lines = [
        "<!-- Auto-generated from Section 10 (References) of the ARF main",
        "     document by tools/gen_references.py. Do not edit by hand.",
        "     Appended to every page via pymdownx.snippets auto_append. -->",
        "",
    ]
    for label, (url, title) in sorted(defs.items(), key=lambda x: x[0].lower()):
        lines.append(f'[{label}]: {url} "{title}"')
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {len(defs)} reference definitions to {OUT.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
