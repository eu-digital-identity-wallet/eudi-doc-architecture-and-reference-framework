# Makefile
# -----------------------------------------------------------------------------
# Converts Markdown to various formats (HTML via MkDocs, PDF, DOCX, EPUB)
# using Pandoc and MkDocs.
#
# Usage:
#   make             - Convert Markdown files to PDF, DOCX, EPUB and build the MkDocs site.
#   make mkdocs      - Build the MkDocs site.
#   make serve       - Serve the MkDocs site locally.
#   make copy-pdfs   - Copy all PDF files from the docs folder to build/pdf.
#   make zip-pdfs    - Create a zip file of all files in the build/pdf folder.
#   make clean       - Delete all generated files.
#
# Prerequisites:
#   - pandoc (Ubuntu: `sudo apt-get install pandoc`)
#   - a LaTeX distribution (for PDF conversion, e.g., xelatex)
#   - mkdocs (and optionally, mkdocs-material and mike)
#
# -----------------------------------------------------------------------------

# Source Files
MAIN_DOC       := docs/architecture-and-reference-framework-main.md
ANNEXES_DOCS   := $(wildcard docs/annexes/annex-[1-3,5]/*.md)
SOURCE_DOCS    := $(MAIN_DOC) $(ANNEXES_DOCS)

# Directories and Build Information
BUILD_DIR      := ./build
SITE_DIR       := ./site
VERSION        := 2.7.3
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

# Pandoc Options
PANDOC_OPTIONS      := --toc --from markdown+gfm_auto_identifiers --data-dir $(PANDOC_DATA_DIR) --metadata date="v$(VERSION)  $(BUILD)"
PANDOC_PDF_OPTIONS  := --pdf-engine=pdflatex --template=$(PDF_TEMPLATE) --syntax-highlighting=idiomatic $(PANDOC_DATA_DIR)/metadata.yml
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

.PHONY: all epub pdf mkdocs serve copy-pdfs zip-pdfs clean

# Default target: build all exported documents and the MkDocs site.
all: $(EXPORTED_DOCS) epub pdf zip-pdfs mkdocs

# EPUB combined main text + annexes
epub :
	@mkdir -p $(BUILD_DIR)/epub
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $(BUILD_DIR)/epub/architecture-and-reference-framework-main-and-annexes.epub $(SOURCE_DOCS)

pdf :
	@mkdir -p $(BUILD_DIR)/pdf
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -M subtitle="Architecture and Reference Framework" -o $(BUILD_DIR)/pdf/architecture-and-reference-framework-main-and-annexes.pdf $(SOURCE_DOCS)
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
zip-pdfs: copy-pdfs
	@echo "Creating zip archive of PDFs in $(BUILD_DIR)/pdf..."
	@cd $(BUILD_DIR) && zip -r arf-pdfs-v$(VERSION).zip pdf/*
	@echo "Zip archive created at $(BUILD_DIR)/pdf.zip."

# Clean generated files and directories.
clean:
	@echo "Cleaning build and site directories..."
	-$(RM) -rf $(BUILD_DIR) $(SITE_DIR)
