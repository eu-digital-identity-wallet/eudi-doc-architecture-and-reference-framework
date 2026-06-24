#!/usr/bin/env python3
"""Validate internal documentation links and section anchors via MkDocs.

The internal half of the docs CI gate (external URLs are handled by lychee,
typos by codespell). It builds the site with MkDocs' link validation turned up
and fails on any broken internal link, nav entry, section anchor or absolute
link, **repo-wide** — the backlog has been cleared, so any new breakage blocks,
wherever it appears (including cross-file breaks, e.g. renaming a heading that
another page links to).

MkDocs' social/privacy plugins need native imaging libraries we don't want in
this job, so we build from a derived config: the real mkdocs.yml with those
plugins stripped. Link validation levels are taken from mkdocs.yml (and forced
on here as a safeguard), and everything else — nav, the pymdownx.snippets
reference machinery, markdown extensions — is inherited unchanged, so the gate
and the published site can't drift apart.

Usage: tools/check_doc_links.py
"""

from __future__ import annotations

import os
import subprocess
import sys
import tempfile

import yaml

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MKDOCS_CONFIG = os.path.join(REPO_ROOT, "mkdocs.yml")

# Plugins that need native imaging libraries (social, privacy) or a versioned
# deploy (mike); none affect link validation, all are dropped for this build.
DROP_PLUGINS = {"social", "privacy", "mike"}

# mkdocs.yml uses Python-specific YAML tags (e.g. the superfences custom fence
# `format: !!python/name:pymdownx.superfences.fence_code_format`). MkDocs' own
# loader resolves them to live objects, but yaml.safe_load can't construct them
# and yaml.safe_dump can't re-serialize them. We don't need their values here —
# only to round-trip them verbatim into the derived config so the MkDocs build
# below parses them exactly as the real site does. Carry each as an opaque tag.
_PY_TAG_PREFIX = "tag:yaml.org,2002:python/"


class _OpaqueTag:
    """A YAML node with a Python-specific tag, preserved tag-and-value as-is."""

    def __init__(self, tag: str, value: str) -> None:
        self.tag = tag
        self.value = value


def _construct_opaque_tag(loader, tag_suffix, node):
    return _OpaqueTag(_PY_TAG_PREFIX + tag_suffix, loader.construct_scalar(node))


def _represent_opaque_tag(dumper, data):
    return dumper.represent_scalar(data.tag, data.value)


yaml.SafeLoader.add_multi_constructor(_PY_TAG_PREFIX, _construct_opaque_tag)
yaml.SafeDumper.add_representer(_OpaqueTag, _represent_opaque_tag)


def derive_config() -> str:
    """Write a temp config: real mkdocs.yml minus DROP_PLUGINS, validation forced on.

    Written into the repo root (not /tmp) so docs_dir, the snippets auto_append
    path and other relative paths resolve exactly as in a normal build. Returns
    the temp file path; caller removes it.
    """
    with open(MKDOCS_CONFIG, encoding="utf-8") as fh:
        config = yaml.safe_load(fh)

    plugins = config.get("plugins")
    if isinstance(plugins, list):
        config["plugins"] = [
            p for p in plugins if not (isinstance(p, str) and p in DROP_PLUGINS)
        ]
    # The mike version provider is meaningless without the mike plugin.
    if "mike" in DROP_PLUGINS:
        config.get("extra", {}).pop("version", None)

    # Safeguard: enforce link validation even if mkdocs.yml is later weakened.
    links = config.setdefault("validation", {}).setdefault("links", {})
    for key in ("not_found", "unrecognized_links", "anchors", "absolute_links"):
        links[key] = "warn"

    fd, path = tempfile.mkstemp(
        prefix="mkdocs.linkcheck.", suffix=".yml", dir=REPO_ROOT
    )
    with os.fdopen(fd, "w", encoding="utf-8") as fh:
        yaml.safe_dump(config, fh, sort_keys=False, allow_unicode=True)
    return path


def run_mkdocs(config_path: str) -> str:
    """Build the site (non-strict) and return MkDocs' combined warning output.

    Non-strict so we collect *every* warning and report them together, rather
    than aborting at the first one.
    """
    with tempfile.TemporaryDirectory() as site_dir:
        proc = subprocess.run(
            ["mkdocs", "build", "-f", config_path, "-d", site_dir],
            cwd=REPO_ROOT,
            capture_output=True,
            text=True,
        )
    return proc.stderr + proc.stdout


def main() -> int:
    config_path = derive_config()
    try:
        output = run_mkdocs(config_path)
    finally:
        os.remove(config_path)

    warnings = [ln.strip() for ln in output.splitlines() if "WARNING" in ln]

    print(f"MkDocs link/anchor/nav warnings: {len(warnings)}")
    if warnings:
        print("\nFix these before merging (broken links / nav / section anchors):")
        for w in warnings:
            print(f"  - {w}")
        print("\nFAIL")
        return 1

    print("OK: no broken internal links, nav entries or section anchors.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
