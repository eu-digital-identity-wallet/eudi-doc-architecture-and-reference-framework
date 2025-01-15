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

MAIN_DOC := docs/arf.md
ANNEXES_DOCS := $(wildcard docs/annexes/annex-[1-3]/*.md)
SOURCE_DOCS=\
			$(MAIN_DOC)\
			$(ANNEXES_DOCS)
BUILD_DIR :=./build

VERSION := 1.5.0
BUILD := $(shell date +%Y%m%d.%H%M%S)
PANDOC_DATA_DIR := ./pandoc
PDF_TEMPLATE := eisvogel
SITE_DIR :=./site
EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.pdf) \
 $(SOURCE_DOCS:.md=.docx) \
 $(SOURCE_DOCS:.md=.epub)

RM=/bin/rm
PANDOC=pandoc
MKDOCS=mkdocs

PANDOC_OPTIONS=--toc --data-dir $(PANDOC_DATA_DIR) --metadata date="v$(VERSION)  $(BUILD)"
PANDOC_PDF_OPTIONS= --pdf-engine=xelatex   --template=$(PDF_TEMPLATE) --listings $(PANDOC_DATA_DIR)/metadata.yml
PANDOC_DOCX_OPTIONS=
PANDOC_EPUB_OPTIONS=--to epub3

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

.PHONY: all clean

all : $(EXPORTED_DOCS) mkdocs

mkdocs:
	$(MKDOCS) build

serve:
	$(MKDOCS) serve

clean:
	- $(RM) -rf $(BUILD_DIR) $(SITE_DIR)

