# Makefile
# Converts Markdown to other formats (HTML, PDF, DOCX, EPUB) using Pandoc and MkDocs
#
# Run "make" (or "make all") to convert to all other formats
# Run "make clean" to delete converted files

# Prerequisites
# Install pandoc, latex and mkdocs in your environment 
#
# Parameters and Variables
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
#

SOURCE_DOCS := $(wildcard docs/*.md)
BUILD_DIR :=./build
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

