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
MAIN_DOC       := docs/architecture-and-reference-framework-main.md
ANNEXES_DOCS   := $(wildcard docs/annexes/annex-[1235]/*.md)
SOURCE_DOCS    := $(MAIN_DOC) $(ANNEXES_DOCS)

# Directories and Build Information
BUILD_DIR      := ./build
SITE_DIR       := ./site
VERSION        := 2.9.0
BUILD          := $(shell date +%Y%m%d.%H%M%S)

# Pandoc configuration
PANDOC_DATA_DIR  := ./pandoc
PDF_TEMPLATE     := eisvogel

# Exported Documents (the target names are based on the source file names)
EXPORTED_DOCS  := \
	$(SOURCE_DOCS:.md=.pdf) \
	$(SOURCE_DOCS:.md=.docx) \
	$(SOURCE_DOCS:.md=.epub)

# Tools
RM      := /bin/rm
PANDOC  := pandoc
MKDOCS  := mkdocs
PYTHON  := python3

# Pandoc Options
# deep-headings.lua (resolved from $(PANDOC_DATA_DIR)/filters/) anchors
# level-6 headings, which LaTeX sectioning cannot represent natively.
PANDOC_OPTIONS      := --toc --from markdown+gfm_auto_identifiers --data-dir $(PANDOC_DATA_DIR) --lua-filter=deep-headings.lua --metadata date="v$(VERSION)  $(BUILD)"
# LuaLaTeX (not pdflatex) is required for the tagged / PDF/A output configured
# via the pdfstandard option in pandoc/metadata.yml.
PANDOC_PDF_OPTIONS  := --pdf-engine=lualatex --template=$(PDF_TEMPLATE) --syntax-highlighting=idiomatic $(PANDOC_DATA_DIR)/metadata.yml
PANDOC_DOCX_OPTIONS :=
PANDOC_EPUB_OPTIONS := --to epub3

# Pattern Rules for Conversions
# -----------------------------------------------------------------------------

# Convert Markdown to PDF
%.pdf : %.md
	@mkdir -p $(BUILD_DIR)/pdf
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $(BUILD_DIR)/pdf/$(notdir $@) $<
# Convert Markdown to DOCX
%.docx : %.md
	@mkdir -p $(BUILD_DIR)/docx
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $(BUILD_DIR)/docx/$(notdir $@) $<

# Convert Markdown to EPUB
%.epub : %.md
	@mkdir -p $(BUILD_DIR)/epub
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $(BUILD_DIR)/epub/$(notdir $@) $<

# Targets
# -----------------------------------------------------------------------------

.PHONY: all pdfs epub pdf mkdocs serve copy-pdfs zip-pdfs clean hltr \
        gate build-strict references check-links check-csv lint-md \
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
pdfs: $(SOURCE_DOCS:.md=.pdf) pdf zip-pdfs

# EPUB combined main text + annexes
epub :
	@mkdir -p $(BUILD_DIR)/epub
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $(BUILD_DIR)/epub/architecture-and-reference-framework-main-and-annexes.epub $(SOURCE_DOCS)

pdf :
	@mkdir -p $(BUILD_DIR)/pdf
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -M subtitle="Architecture and Reference Framework" -o $(BUILD_DIR)/pdf/architecture-and-reference-framework-main-and-annexes.pdf $(SOURCE_DOCS)
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
zip-pdfs: copy-pdfs | $(SOURCE_DOCS:.md=.pdf) pdf
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
gate: check-private-links check-links check-csv lint-md
	@echo "All repo-wide docs-quality checks passed."
