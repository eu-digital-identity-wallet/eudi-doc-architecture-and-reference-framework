# CI gates and release workflow

This guide explains the automated checks ("gates") that run on every pull
request, and the branch model to follow when preparing a release. It complements
[CONTRIBUTING.md](CONTRIBUTING.md), which covers issues, editorial style and the
PR checklist.

> **TL;DR** — Open small PRs into a `feature/<release>` branch; each must pass the
> gates. Edit the **CSV**, never the generated Annex 2 Markdown. Never link to a
> `*-private` repository. When the feature branch is ready, review it through a
> single `feature/<release> → review/<release>` PR, then publish to the public
> `main` and sync the two `main` branches.

---

> **Governance.** The ARF is informative guidance that supports the legally
> binding Implementing Regulations. All **content** changes are subject to the
> **opinion of the European Digital Identity Cooperation Group** and **approval
> by the European Commission**, regardless of how they reach the repository.

## 1. When the gates run

The workflow in [`.github/workflows/ci.yml`](.github/workflows/ci.yml) runs on
every pull request whose **target branch** is:

- `main`
- a release branch — `feature/**`
- a review branch — `review/**`

GitHub runs a PR's workflow from its **target branch's** copy of `ci.yml`, so a
branch is only gated once that branch carries these triggers and the gate
tooling. `main`, `feature/2.10.0` and `review/2.10.0` are set up; new release and
review branches inherit the gate automatically when they are cut from `main`.

## 2. What runs — three parallel jobs

All three jobs must be green before a PR can merge.

### 2.1 `build-docs` — strict site build

Regenerates `includes/references.md` (from the Section 10 reference tables) and
the Annex 2 pages from the HLR CSV, then runs `mkdocs build --strict`. The
`--strict` flag fails on broken navigation, dead internal links, missing section
anchors and malformed Markdown.

### 2.2 `build-pdf` — full PDF build

Builds the PDFs with the same pinned Pandoc/LaTeX image used by the release
deploy, so a change that breaks the PDF fails here instead of at release time.
(PRs opened from forks cannot pull the org's GHCR build image, so this job only
validates branches within this repository.)

### 2.3 `docs-quality` — link / reference / typo / lint gate

| Check | Tool / config | Scope | Fails on |
|-------|---------------|-------|----------|
| Private-repo links | `grep` guard | repo-wide | any link to a `…-private` repository (these 404 in the public mirror) |
| Internal links & anchors | `tools/check_doc_links.py` | repo-wide | broken relative links, nav entries, section anchors, absolute links |
| Markdown lint | `markdownlint-cli2` + [`.markdownlint-cli2.jsonc`](.markdownlint-cli2.jsonc) | repo-wide | curated correctness rules (heading levels, table columns, bare URLs, spaces in emphasis, …); generated Annex 2 pages are excluded |
| HLR CSV structure | `tools/check_hltr_csv.py` | repo-wide | malformed CSV (wrong header or field count). Data-quality issues (duplicate IDs, empty keys) are reported as **warnings** |
| Typos | `codespell` + `.codespellrc` | changed Markdown | misspellings outside the allowlist |
| External URLs | `lychee` + `lychee.toml` | changed Markdown | dead `http(s)` links |

A fourth job, `regenerate-hltr`, runs when the CSV changes: it regenerates the
Annex 2 pages and commits them back to your PR branch, so you only ever edit the
CSV.

**Repo-wide vs. changed-files.** Internal links, anchors, markdown lint and the
CSV structure are validated **repo-wide** — their backlogs are cleared, so a
problem *anywhere* fails the build. Typos and external URLs are scoped to the
**files a PR changes**, because the typo allowlist is young and external links
rot over time; pre-existing issues there burn down as files are edited rather
than blocking unrelated PRs.

## 3. Editing the High-Level Requirements (Annex 2)

`hltr/high-level-requirements.csv` is the **single source of truth**. Do **not**
edit `docs/annexes/annex-2/annex-2.02-*.md` or `annex-2.03-*.md` directly — they
are generated from the CSV. Edit the CSV; run `make hltr` to preview locally, and
the `regenerate-hltr` job will regenerate and commit the Markdown on your PR.

## 4. Setting up a local environment

The gate needs a Python toolchain and Node.js (for the markdown lint); the strict
site build and the PDFs need some extra tooling. Install only what you need for
the checks you want to run.

### Python toolchain

```bash
python3 -m venv .venv
source .venv/bin/activate            # Windows (PowerShell): .venv\Scripts\Activate.ps1
pip install -r requirements.txt codespell==2.4.2
```

`requirements.txt` pins MkDocs, Material (with the `imaging` extra), `mike` and
`jinja2`; `codespell` is pinned separately to match CI.

### Node.js (markdown lint)

`make lint-md` runs `npx markdownlint-cli2`, which needs
[Node.js](https://nodejs.org); `npx` downloads the linter on first use.

### Imaging libraries (for `make build-strict`)

The strict build renders social cards (the `social` / `privacy` plugins), which
need the Cairo/Pango libraries:

- **macOS:** `brew install cairo freetype libffi libjpeg libpng pango`
- **Debian/Ubuntu:** `sudo apt-get install libcairo2-dev libfreetype6-dev libffi-dev libjpeg-dev libpng-dev libpango1.0-dev`

`make gate` and `make check-links` use an imaging-free configuration and do
**not** need these.

### lychee (for `make check-external`, optional)

External-link checking uses [lychee](https://github.com/lycheeverse/lychee)
(`brew install lychee`, `cargo install lychee`, or a prebuilt release binary).

### PDF toolchain (for `make pdfs`)

The PDFs build with Pandoc + LuaLaTeX + the Eisvogel template and a curated TeX
Live set. The simplest way is the **same container CI uses** (you may need to
`docker login ghcr.io` first):

```bash
docker run --rm -v "$PWD":/work -w /work \
  ghcr.io/eu-digital-identity-wallet/arf-pdf-builder@sha256:e0d19dabca3a03ba8c716976b72f6b819751ff41ea223fb7fb3468122aa3ef05 \
  make pdfs
```

PDFs land in `build/pdf/`. Alternatively, install Pandoc and a LaTeX distribution
locally and run `make pdfs` directly (heavier).

## 5. Running the gate locally

The Makefile targets mirror the CI jobs (the full list is in the Makefile
header):

```bash
make gate                                     # docs-quality: links, anchors, lint, CSV, private-links
make build-strict                             # build-docs: strict MkDocs build
make pdfs                                     # build-pdf: the release PDFs
make check-typos    FILES="docs/your-edit.md" # typos on your changed files
make check-external FILES="docs/your-edit.md" # external links on your changed files
```

The individual repo-wide checks are also available: `make check-links`,
`make check-csv`, `make lint-md`, `make check-private-links`.

### Common fixes

- **Bare URL flagged (MD034):** wrap it as `<https://example.org/>`.
- **Broken anchor:** MkDocs slugifies `## Topic 9 - X` to `#topic-9-x` (single
  dash), unlike GitHub's `#topic-9---x`. For same-repo links use a **relative**
  link with the MkDocs slug, not an absolute `github.com/…/blob/…` URL.
- **`…-private` link:** use the public repository URL (drop the `-private`
  suffix) or a relative link.

## 6. Release workflow

### Why this workflow

The ARF is maintained across **two synchronized repositories** and takes
contributions from two sources:

- **Public** issues and pull requests; and
- **Member State** feedback channelled through the **European Digital Identity
  Cooperation Group**.

The branch model below consolidates both streams into a single, reviewable
release, gates every change, and keeps the two repositories in sync. (As noted
above, the content itself is subject to the Cooperation Group's opinion and the
Commission's approval.)

### Branch model

| Branch | Role |
|--------|------|
| `main` | The released ARF — mirrored across the two synchronized repositories. |
| `feature/<release>` | Working branch where a release's changes accumulate (e.g. `feature/2.10.0`), branched from `main`. |
| `review/<release>` | A snapshot branched from `main`, used to present the full release diff for review. |

### Steps

1. **Start the release.** Branch `main` → `feature/<release>`.
2. **Do the work as small, focused PRs.** For each unit of work, open an issue
   and a PR **targeting `feature/<release>`**, linked to the issue (e.g.
   `Closes #123`); public contributions and Cooperation Group feedback both land
   here. Each PR runs the full gate; merge it when green. Repeat until
   `feature/<release>` holds the complete release.
3. **Open the review.** When `feature/<release>` is ready, branch `main` →
   `review/<release>` (fresh from `main`), then open **one** PR:
   `feature/<release>` → `review/<release>`. Because `review/<release>` starts
   from `main`, this PR's diff is the **entire release versus `main`** — it
   previews how `main` will look after the release and gives reviewers the full
   picture in one place. The gate runs on this PR too.
4. **Review cycle.** Address review feedback with further small PRs into
   `feature/<release>`.
5. **Land the review branch.** When the review is complete, merge
   `feature/<release>` → `review/<release>`; `review/<release>` now holds the
   final release.
6. **Publish.** Push `review/<release>` to the **public** repository and merge it
   into its `main`.
7. **Sync the two mains.** Sync the two repositories' `main` branches so both are
   identical again.

### At a glance

```mermaid
flowchart LR
  M[main] -->|1. branch| F[feature/&lt;release&gt;]
  I([public issues / PRs<br/>Cooperation Group feedback]) -. 2. small gated PRs .-> F
  M -->|3. branch fresh| R[review/&lt;release&gt;]
  F -->|3. one PR: full release diff<br/>4. review cycle<br/>5. merge| R
  R -->|6. push + merge to public repo| P[(public main)]
  P -->|7. sync| M
```

---

Questions about the gates or the workflow? Open an issue with the `question`
label (see [CONTRIBUTING.md](CONTRIBUTING.md) §10).
