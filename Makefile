# Makefile
# Converts Markdown to other formats (HTML, PDF, DOCX, EPUB) using Pandoc and MkDocs
#
# Run "make" (or "make all") to convert to all other formats
# Run "make clean" to delete converted files

# Prerequisites
# Install pandoc, latex and mkdocs in your environment 
#  - Ubuntu: `sudo apt-get install pandoc`
#
# Parameters and Variables
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
#

# Convert .docx to .md
# pandoc --extract-media ./assets input.docx -o output.md

SOURCE_DOCS := $(wildcard docs/*.md)
BUILD_DIR :=./build
EPUB_OUTPUT := $(BUILD_DIR)/epub/arf+annexes.epub
MD_FILES := docs/arf.md $(sort $(wildcard docs/annexes/*/*.md))
SITE_DIR :=./site
EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.pdf) \
 $(SOURCE_DOCS:.md=.docx) \
 $(SOURCE_DOCS:.md=.epub)

RM=/bin/rm
PANDOC=pandoc
MKDOCS=mkdocs

PANDOC_OPTIONS=--toc --metadata title="The European Digital Identity Wallet Architecture and Reference Framework" --metadata lang="en" --data-dir docs/media
PANDOC_PDF_OPTIONS= --pdf-engine=xelatex
PANDOC_DOCX_OPTIONS=
PANDOC_EPUB_OPTIONS=--to epub3

# Check if the pandoc is installed
check-pandoc:
	@which pandoc > /dev/null || (echo "Pandoc not found, installing..." && make install-pandoc)

install-pandoc:
	sudo apt-get update && sudo apt-get install -y pandoc

# Pattern-matching Rules

%.pdf : %.md
	mkdir -p $(BUILD_DIR)/pdf
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $(BUILD_DIR)/pdf/$(notdir $@) $<

%.docx : %.md
	mkdir -p $(BUILD_DIR)/docx
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $(BUILD_DIR)/docx/$(notdir $@) $<

%.epub : %.md
	mkdir -p $(BUILD_DIR)/epub
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $(BUILD_DIR)/epub/$(notdir $@) $<


# Targets and dependencies

.PHONY: all clean combined.epub

all : $(EXPORTED_DOCS) mkdocs

# Target to create an EPUB from arf.md and all the annexes.
epub: check-pandoc 
	mkdir -p $(BUILD_DIR)/epub
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $(EPUB_OUTPUT) $(MD_FILES)

mkdocs:
	$(MKDOCS) build

serve:
	$(MKDOCS) serve

clean:
	- $(RM) -rf $(BUILD_DIR) $(SITE_DIR)

