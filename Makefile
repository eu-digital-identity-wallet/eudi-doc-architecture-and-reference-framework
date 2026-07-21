# Makefile
# -----------------------------------------------------------------------------
# Converts Markdown to various formats (HTML via MkDocs, PDF, DOCX, EPUB)
# using Pandoc and MkDocs.
#
# Usage:
#   make             - Convert Markdown files to PDF, DOCX, EPUB and build the MkDocs site.
#   make hltr        - Regenerate the Annex 2 requirements markdown from the HLTR CSV.
#   make mkdocs      - Build the MkDocs site.
#   make serve       - Serve the MkDocs site locally.
#   make pdfs        - Build the release PDFs (build-pdf job; needs pandoc + LaTeX).
#   make copy-pdfs   - Copy all PDF files from the docs folder to build/pdf.
#   make zip-pdfs    - Create a zip file of all files in the build/pdf folder.
#   make clean       - Delete all generated files.
#
# CI gate targets (mirror .github/workflows/ci.yml; see CI_AND_RELEASE_WORKFLOW.md):
#   make gate                - Run the repo-wide docs-quality checks (all must pass).
#   make build-strict        - build-docs job: strict MkDocs build (needs imaging libs).
#   make check-links         - Internal links + section anchors (repo-wide).
#   make check-csv           - HLR CSV structure (repo-wide).
#   make lint-md             - Markdown lint (repo-wide; needs Node.js / npx).
#   make check-private-links - Reject links to *-private repositories (repo-wide).
#   make check-typos  FILES="docs/a.md"  - Typos (codespell) on the given files.
#   make check-external FILES="docs/a.md" - External links (lychee) on the given files.
#
# Prerequisites:
#   - pandoc (Ubuntu: `sudo apt-get install pandoc`)
#   - a LaTeX distribution (for PDF conversion, e.g., xelatex)
#   - mkdocs (and optionally, mkdocs-material and mike)
#
# -----------------------------------------------------------------------------

# Source Files
# The main document is split into one file per chapter under docs/main/. The
# combined PDF concatenates them in order (index first, then 01..11); the sort
# on the zero-padded NN- prefix gives the right order. Per-chapter PDFs are not
# built — the per-chapter organisation lives on the website (combined PDF only).
MAIN_DOCS      := docs/main/index.md $(sort $(wildcard docs/main/[0-9][0-9]-*.md))
ANNEXES_DOCS   := $(wildcard docs/annexes/annex-[1235]/*.md)
SOURCE_DOCS    := $(MAIN_DOCS) $(ANNEXES_DOCS)
# Per-document PDFs are built for the annexes only, not the main chapters.
PERDOC_DOCS    := $(ANNEXES_DOCS)

# Directories and Build Information
BUILD_DIR      := ./build
SITE_DIR       := ./site
VERSION        := 3.0.0
BUILD          := $(shell date +%Y%m%d.%H%M%S)

# Pandoc configuration
PANDOC_DATA_DIR  := ./pandoc
PDF_TEMPLATE     := eisvogel

# Exported Documents (the target names are based on the source file names)
EXPORTED_DOCS  := \
	$(PERDOC_DOCS:.md=.pdf) \
	$(PERDOC_DOCS:.md=.docx) \
	$(PERDOC_DOCS:.md=.epub)

# Tools
RM      := /bin/rm
PANDOC  := pandoc
MKDOCS  := mkdocs
PYTHON  := python3

# Material for MkDocs emits a MkDocs-2.0 deprecation notice; suppress it so
# `make build-strict` (mkdocs --strict) does not fail on it.
export DISABLE_MKDOCS_2_WARNING := true

# Pandoc Options
# deep-headings.lua (resolved from $(PANDOC_DATA_DIR)/filters/) anchors
# level-6 headings, which LaTeX sectioning cannot represent natively.
# --resource-path: the combined build concatenates files from several directories,
# so pandoc's default (first input's directory) does not resolve every image.
# The main chapters (docs/main/) reference ../media (i.e. docs/media/) and the
# design-guide annex references ./media/5.01 (docs/annexes/annex-5/media/); list
# both bases (relative to the repo root, where pandoc runs) so all figures embed.
PANDOC_OPTIONS      := --toc --from markdown+gfm_auto_identifiers --data-dir $(PANDOC_DATA_DIR) --lua-filter=deep-headings.lua --resource-path=.:docs/main:docs/annexes/annex-5 --metadata date="v$(VERSION)  $(BUILD)"
# LuaLaTeX (not pdflatex) is required for the tagged / PDF/A output configured
# via the pdfstandard option in pandoc/metadata.yml.
PANDOC_PDF_OPTIONS  := --pdf-engine=lualatex --template=$(PDF_TEMPLATE) --syntax-highlighting=idiomatic $(PANDOC_DATA_DIR)/metadata.yml
PANDOC_DOCX_OPTIONS :=
PANDOC_EPUB_OPTIONS := --to epub3

# Reference-definition layer appended to pandoc invocations. pandoc does not know
# mkdocs' shorthand/autorefs resolution, so without these files [CIR ...],
# [OpenID4VCI], [Topic N][topic-N] etc. render as literal "[...]" text in the PDF.
# Both files are generated (tools/gen_references.py, gen_pandoc_refs.py) and
# committed; the PDF build in CI consumes the committed files.
#
# The split matters: references.md holds EXTERNAL [shorthand]: url definitions,
# safe to append to any build. pandoc-refs.md holds INTERNAL [topic-N]: #topic-N
# definitions whose targets (the #topic-N anchors) live in Annex 2.02 — so it is
# appended only to the COMBINED build, where every anchor is present. Appending it
# to a per-document build (e.g. main.pdf without Annex 2.02) would point every
# \hyperref at a missing label, i.e. "undefined reference" warnings.
PANDOC_REFS          := includes/references.md
PANDOC_REFS_INTERNAL := includes/pandoc-refs.md

# Pattern Rules for Conversions
# -----------------------------------------------------------------------------

# Convert Markdown to PDF. PANDOC_REFS is appended (and listed as a prerequisite
# so a change to it forces a rebuild) to resolve shorthand / autorefs references.
%.pdf : %.md $(PANDOC_REFS)
	@mkdir -p $(BUILD_DIR)/pdf
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $(BUILD_DIR)/pdf/$(notdir $@) $< $(PANDOC_REFS)
# Convert Markdown to DOCX
%.docx : %.md $(PANDOC_REFS)
	@mkdir -p $(BUILD_DIR)/docx
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $(BUILD_DIR)/docx/$(notdir $@) $< $(PANDOC_REFS)

# Convert Markdown to EPUB
%.epub : %.md $(PANDOC_REFS)
	@mkdir -p $(BUILD_DIR)/epub
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $(BUILD_DIR)/epub/$(notdir $@) $< $(PANDOC_REFS)

# Targets
# -----------------------------------------------------------------------------

.PHONY: all pdfs epub pdf mkdocs serve copy-pdfs zip-pdfs clean hltr \
        gate build-strict references pandoc-refs check-links check-csv lint-md \
        check-private-links check-typos check-external

# Default target: build all exported documents and the MkDocs site.
all: $(EXPORTED_DOCS) epub pdf zip-pdfs mkdocs

# PDF-only artifacts (per-document + combined + zip), without DOCX/EPUB or the
# MkDocs site. Used by the CI PDF build, which runs in a pandoc/LaTeX container
# that has no mkdocs and only needs build/pdf.
#
# Each PDF is an independent LuaLaTeX compile, so this is the slow part of the
# build. It is safe to run with `make -j` (e.g. `make -j"$(nproc)" pdfs`): the
# per-document PDFs and the combined PDF build concurrently, and the order-only
# barrier on zip-pdfs (see below) holds the archive back until every PDF exists.
pdfs: $(PERDOC_DOCS:.md=.pdf) pdf zip-pdfs

# EPUB combined main text + annexes
epub : $(PANDOC_REFS) $(PANDOC_REFS_INTERNAL)
	@mkdir -p $(BUILD_DIR)/epub
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $(BUILD_DIR)/epub/architecture-and-reference-framework-main-and-annexes.epub $(SOURCE_DOCS) $(PANDOC_REFS) $(PANDOC_REFS_INTERNAL)

pdf : $(PANDOC_REFS) $(PANDOC_REFS_INTERNAL)
	@mkdir -p $(BUILD_DIR)/pdf
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -M subtitle="Architecture and Reference Framework" -o $(BUILD_DIR)/pdf/architecture-and-reference-framework-main-and-annexes.pdf $(SOURCE_DOCS) $(PANDOC_REFS) $(PANDOC_REFS_INTERNAL)
# Regenerate the Annex 2 high-level-requirements markdown (annex-2.02 and
# annex-2.03) from hltr/high-level-requirements.csv. Run after editing the CSV
# and commit the result; CI fails if the markdown is out of sync with the CSV.
hltr:
	$(PYTHON) hltr/scripts/generate-annex-2-high-level-requirements-by-topic.py
	$(PYTHON) hltr/scripts/generate-annex-2-high-level-requirements-by-category.py

# Build the MkDocs site
mkdocs:
	$(MKDOCS) build

# Serve the MkDocs site locally
serve:
	$(MKDOCS) serve

# Copy all PDF files from the docs folder to the build/pdf directory.
copy-pdfs:
	@echo "Copying PDF files from docs/ to $(BUILD_DIR)/pdf/..."
	@mkdir -p $(BUILD_DIR)/pdf
	@find docs -maxdepth 3 -type f -iname "*.pdf" -exec cp {} $(BUILD_DIR)/pdf \;
	@echo "PDF files have been copied."

# Create a zip archive of all files in the build/pdf folder.
# copy-pdfs (a normal prerequisite) brings in the committed annex-4/annex-6
# PDFs; the order-only prerequisites after | force every *generated* PDF to be
# built first. Together they guarantee a complete build/pdf/ before we archive
# it, so `make -j pdfs` can never zip a partial build.
zip-pdfs: copy-pdfs | $(PERDOC_DOCS:.md=.pdf) pdf
	@echo "Creating zip archive of PDFs in $(BUILD_DIR)/pdf..."
	@cd $(BUILD_DIR) && zip -r arf-pdfs-v$(VERSION).zip pdf/*
	@echo "Zip archive created at $(BUILD_DIR)/arf-pdfs-v$(VERSION).zip."

# Clean generated files and directories.
clean:
	@echo "Cleaning build and site directories..."
	-$(RM) -rf $(BUILD_DIR) $(SITE_DIR)

# CI gate targets
# -----------------------------------------------------------------------------
# Run the same checks as .github/workflows/ci.yml locally. The repo-wide checks
# (links, anchors, markdown, CSV, private-repo links) must be clean everywhere.
# Typos and external links are scoped in CI to a PR's changed files; run them
# here on FILES (default: every Markdown file under docs/ and includes/), e.g.
#   make check-typos FILES="docs/discussion-topics/x.md"
# See CI_AND_RELEASE_WORKFLOW.md for environment setup.
FILES ?= $(shell find docs includes -name '*.md' 2>/dev/null)

# Regenerate includes/references.md so [shorthand] links resolve (used below).
references:
	$(PYTHON) tools/gen_references.py

# Regenerate includes/pandoc-refs.md ([topic-N]: #topic-N definitions) so the PDF
# build resolves the internal-anchor shorthands. Reads the generated Annex 2.02,
# so run `make hltr` first (CI regenerates before building).
pandoc-refs:
	$(PYTHON) tools/gen_pandoc_refs.py

# build-docs job: strict MkDocs build (broken nav / dead links / anchors /
# markdown). Uses the full site config (social/privacy plugins), so it needs the
# imaging libraries — see CI_AND_RELEASE_WORKFLOW.md.
build-strict: references hltr
	$(MKDOCS) build --strict

# docs-quality: internal links + section anchors (repo-wide; imaging-free).
check-links: references
	$(PYTHON) tools/check_doc_links.py

# docs-quality: HLR CSV structure (repo-wide).
check-csv:
	$(PYTHON) tools/check_hltr_csv.py

# docs-quality: [Topic N] autorefs cross-reference convention (repo-wide).
# Every [Topic N][topic-N] must resolve to a #topic-N anchor, and no inline
# [Topic N](...) link may reappear. Reads the generated Annex 2.02, so it
# assumes `make hltr` has run (CI regenerates before the gate).
check-topic-refs:
	$(PYTHON) tools/check_topic_refs.py

# docs-quality: markdown lint (repo-wide; needs Node.js / npx).
lint-md:
	npx --yes markdownlint-cli2 "docs/**/*.md"

# docs-quality: no links to *-private repositories (repo-wide).
check-private-links:
	@if grep -rnE --include='*.md' --include='*.csv' \
		'github\.com/eu-digital-identity-wallet/[a-z0-9-]+-private' docs includes hltr; then \
		echo "ERROR: link(s) to a *-private repo — use the public URL or a relative link."; \
		exit 1; \
	fi

# docs-quality: typos (codespell, allowlist in .codespellrc).
check-typos:
	codespell $(FILES)

# docs-quality: external http(s) links (lychee config in lychee.toml).
check-external:
	lychee --config lychee.toml --no-progress $(FILES)

# Run the repo-wide docs-quality checks (everything that must be clean
# everywhere). Typos and external links are changed-files in CI, so run them
# separately on your edits with check-typos / check-external.
gate: check-private-links check-links check-csv check-topic-refs lint-md
	@echo "All repo-wide docs-quality checks passed."
