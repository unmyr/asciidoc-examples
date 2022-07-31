BASE_DIR=..
DOC_ROOT=.

DEST_DIR=$(BASE_DIR)/dist
SRC_IMAGES_DIR=$(IMAGES_DIR)
DST_IMAGES_DIR=$(DEST_DIR)/$(IMAGES_DIR)

include $(DOC_ROOT)/asciidoc.mk

HTML_LIST=\
mkdir_and_copy \
$(DEST_DIR)/asciidoc_block_admonition.html \
$(DEST_DIR)/asciidoc_blocks.html \
$(DEST_DIR)/asciidoc_icons.html \
$(DEST_DIR)/asciidoc_images.html \
$(DEST_DIR)/asciidoc_listing.html \
$(DEST_DIR)/asciidoc_tables.html \
$(DEST_DIR)/diagram-graphviz.html \
$(DEST_DIR)/diagram-plantuml.html \
$(DEST_DIR)/math_font_chars.html \
$(DEST_DIR)/math_font_symbols.html \
$(DEST_DIR)/math.html \
$(DEST_DIR)/index.html

.PHONY: adoc mkdir_and_copy

adoc: $(HTML_LIST)

mkdir_and_copy:
	mkdir -p $(DEST_DIR)
	-test -d $(DST_IMAGES_DIR) || mkdir -p $(DST_IMAGES_DIR)
	-test ! -d $(SRC_IMAGES_DIR) || cp $(CP_OPTS) $(SRC_IMAGES_DIR)/* $(DST_IMAGES_DIR)/

$(DEST_DIR)/math.html: math.adoc header.adoc
	asciidoctor --trace $(AD_OPTS_HTML5_STEM) -o "$@" "$<"

$(DEST_DIR)/%.html: %.adoc header.adoc
	asciidoctor --trace $(AD_OPTS_HTML5_ROUGE) -o "$@" "$<"
