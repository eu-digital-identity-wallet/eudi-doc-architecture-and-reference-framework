"""MkDocs build hook: fragment-aware redirect for the old main-document URL.

The main document was split into docs/main/NN-*.md (one page per chapter). A
plain page-level redirect (mkdocs-redirects) can only send the old single-page
URL to one new page, so a deep bookmark like
    …/architecture-and-reference-framework-main/#6631-…
would lose its section. This hook instead emits a redirect page carrying a map
from every main-document section slug to the chapter page that now holds it, and
a small script that routes the incoming #fragment to the right chapter (falling
back to the landing page when there is no fragment or no match).

The map is built from the chapter files at build time; the destinations are
relative (`../main/<chapter>/#<slug>`), so they work under any mike version
prefix (/latest/, /3.0.0/, …). Runs on every build (site, strict, deploy).
"""
from __future__ import annotations

import html
import json
import pathlib
import re
import unicodedata

HEADING_RE = re.compile(r"(?m)^#{1,6}\s+(.*?)\s*$")
HEADING_ATTR_RE = re.compile(r"\{\s*#([\w-]+)\s*\}\s*$")
# Old single-page path (use_directory_urls: true -> its own index.html directory).
OLD_PATH = "architecture-and-reference-framework-main"

# Anchors that were renamed during the split (so an old bookmark still routes
# precisely instead of falling back to the landing page). 3.1 Introduction shared
# the slug "31-introduction" with several discussion papers, so it was given a
# unique id; map the old slug to its chapter.
ALIASES = {"31-introduction": "03-roles-within-the-eudi-wallet-ecosystem"}


def _slugify(text: str) -> str:
    v = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode("ascii")
    v = re.sub(r"[^\w\s-]", "", v).strip().lower()
    return re.sub(r"[\s]+", "-", v)


def _anchor_map(docs_dir: pathlib.Path) -> dict[str, str]:
    """slug -> chapter directory name (e.g. '6631-…' -> '06-trust-model').

    First occurrence wins if a slug appears in more than one chapter (the numbered
    section slugs are unique; only rare unnumbered duplicates could clash, and for
    those an old link simply falls back to the landing page)."""
    mapping: dict[str, str] = {}
    for f in sorted((docs_dir / "main").glob("[0-9][0-9]-*.md")):
        chapter = f.stem
        for heading in HEADING_RE.findall(f.read_text(encoding="utf-8")):
            attr = HEADING_ATTR_RE.search(heading)
            slug = attr.group(1) if attr else _slugify(heading)
            if slug:
                mapping.setdefault(slug, chapter)
    for old_slug, chapter in ALIASES.items():
        mapping.setdefault(old_slug, chapter)
    return mapping


def _page(mapping: dict[str, str]) -> str:
    data = json.dumps(mapping, separators=(",", ":"), sort_keys=True)
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Architecture and Reference Framework</title>
<script>
// The main document moved to one page per chapter under ../main/. Route the
// incoming #section fragment to the chapter that now holds it.
var MAP = {data};
var frag = (location.hash || "").replace(/^#/, "");
var dest = Object.prototype.hasOwnProperty.call(MAP, frag)
  ? "../main/" + MAP[frag] + "/#" + frag
  : "../main/";
location.replace(dest);
</script>
<meta http-equiv="refresh" content="0; url=../main/">
<link rel="canonical" href="../main/">
</head>
<body>
<p>The Architecture and Reference Framework main document has moved to
<a href="../main/">one page per chapter</a>.</p>
</body>
</html>
"""


def on_post_build(config, **kwargs) -> None:
    docs_dir = pathlib.Path(config["docs_dir"])
    site_dir = pathlib.Path(config["site_dir"])
    out = site_dir / OLD_PATH / "index.html"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(_page(_anchor_map(docs_dir)), encoding="utf-8")
