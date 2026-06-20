#!/usr/bin/env python3
"""Validate internal documentation links and section anchors via MkDocs.

This is the internal half of the docs CI gate (external URLs are handled by
lychee, typos by codespell). It builds the site with MkDocs' own link
validation turned up and decides pass/fail from the warnings, with two
different policies because the two backlogs are in different states:

  * not-found / unrecognized / nav links  -> FAIL repo-wide.
        These are already clean across the whole site, so any new one --
        including a cross-file break, e.g. renaming a heading that another
        page links to -- must block, wherever it appears.

  * broken '#anchor' (section) references  -> FAIL only for changed files.
        There is a backlog of pre-existing broken anchors (mostly stale
        links into the generated annex-2 topic pages). We gate these on the
        files a PR actually touches and burn the backlog down over time,
        rather than blocking every PR on debt it did not introduce. Once the
        backlog reaches zero, move `anchors` to repo-wide by setting
        `validation.links.anchors: warn` in mkdocs.yml directly and dropping
        the changed-files filter here.

MkDocs does not validate anchors by default, and its social/privacy plugins
need native imaging libraries we don't want in this job, so we build from a
derived config: the real mkdocs.yml with those plugins stripped and anchor
validation enabled. Everything else (nav, the pymdownx.snippets reference
machinery, markdown extensions) is inherited unchanged, so there is no risk
of the gate and the published site drifting apart.

Usage:
    tools/check_doc_links.py [--changed-from FILE] [--changed PATH ...]

`--changed-from` reads newline-separated paths (the CI passes the PR's
changed files); `--changed` adds paths individually. With no changed files
given, only the repo-wide policy can fail (anchors are reported but not
enforced).
"""

from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
import tempfile

import yaml

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MKDOCS_CONFIG = os.path.join(REPO_ROOT, "mkdocs.yml")

# Plugins that need native imaging libraries (social, privacy) or a versioned
# deploy (mike); none affect link validation, all are dropped for this build.
DROP_PLUGINS = {"social", "privacy", "mike"}

# A warning is about a section anchor (vs. a missing page / nav entry) iff it
# matches one of these. Both the cross-file and same-page phrasings are here.
ANCHOR_MARKERS = (
    "does not contain an anchor",
    "there is no such anchor",
)

# Pull the owning page out of "Doc file 'PATH' contains a link ...".
DOC_FILE_RE = re.compile(r"Doc file '([^']+)'")


def derive_config() -> str:
    """Write a temp config: real mkdocs.yml minus DROP_PLUGINS, anchors on.

    Written into the repo root (not /tmp) so docs_dir, the snippets
    auto_append path and other relative paths resolve exactly as in a normal
    build. Returns the temp file path; caller removes it.
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

    validation = config.setdefault("validation", {})
    links = validation.setdefault("links", {})
    links.setdefault("not_found", "warn")
    links.setdefault("unrecognized_links", "warn")
    links["anchors"] = "warn"
    links["absolute_links"] = "warn"

    fd, path = tempfile.mkstemp(
        prefix="mkdocs.linkcheck.", suffix=".yml", dir=REPO_ROOT
    )
    with os.fdopen(fd, "w", encoding="utf-8") as fh:
        yaml.safe_dump(config, fh, sort_keys=False, allow_unicode=True)
    return path


def run_mkdocs(config_path: str) -> str:
    """Build the site (non-strict) and return MkDocs' combined warning output.

    Non-strict so we collect *every* warning and apply our own policy, rather
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


def normalize(path: str) -> str:
    """Normalize a doc path to be comparable with the git changed-file list.

    MkDocs reports paths relative to docs_dir (e.g. 'discussion-topics/x.md');
    git reports them from the repo root ('docs/discussion-topics/x.md').
    """
    path = path.strip().lstrip("./")
    if not path.startswith("docs/"):
        path = "docs/" + path
    return path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--changed", action="append", default=[], metavar="PATH")
    parser.add_argument("--changed-from", metavar="FILE")
    args = parser.parse_args()

    changed = {normalize(p) for p in args.changed}
    if args.changed_from:
        with open(args.changed_from, encoding="utf-8") as fh:
            changed.update(normalize(line) for line in fh if line.strip())

    config_path = derive_config()
    try:
        output = run_mkdocs(config_path)
    finally:
        os.remove(config_path)

    link_failures = []           # not-found / unrecognized / nav, repo-wide
    anchor_changed = []          # broken anchors in changed files (blocking)
    anchor_backlog = 0           # broken anchors elsewhere (reported only)

    for line in output.splitlines():
        if "WARNING" not in line:
            continue
        is_anchor = any(marker in line for marker in ANCHOR_MARKERS)
        if not is_anchor:
            link_failures.append(line.strip())
            continue
        match = DOC_FILE_RE.search(line)
        owner = normalize(match.group(1)) if match else None
        if owner in changed:
            anchor_changed.append(line.strip())
        else:
            anchor_backlog += 1

    print(f"Changed docs files considered: {len(changed)}")
    print(
        f"MkDocs warnings: {len(link_failures)} link/nav, "
        f"{len(anchor_changed) + anchor_backlog} broken-anchor "
        f"({anchor_backlog} pre-existing in unchanged files, not blocking)."
    )

    if link_failures:
        print("\nBroken links / nav (must be fixed — these block repo-wide):")
        for w in link_failures:
            print(f"  - {w}")

    if anchor_changed:
        print("\nBroken section anchors in files this PR changed (must be fixed):")
        for w in anchor_changed:
            print(f"  - {w}")

    if link_failures or anchor_changed:
        print("\nFAIL: fix the links/anchors above before merging.")
        return 1

    print("\nOK: no blocking link or anchor problems.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
