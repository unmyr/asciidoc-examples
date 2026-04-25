BASE_DIR=..
DOC_ROOT=.

DIST_DIR=$(BASE_DIR)/dist
SRC_IMAGES_DIR=$(IMAGES_DIR)
DST_IMAGES_DIR=$(DIST_DIR)/$(IMAGES_DIR)

include $(DOC_ROOT)/asciidoc.mk

HTML_LIST=\
mkdir_and_copy \
$(DIST_DIR)/asciidoc_block_admonition.html \
$(DIST_DIR)/asciidoc_blocks.html \
$(DIST_DIR)/asciidoc_conditionals.html \
$(DIST_DIR)/asciidoc_fonts.html \
$(DIST_DIR)/asciidoc_icons.html \
$(DIST_DIR)/asciidoc_images.html \
$(DIST_DIR)/asciidoc_listing.html \
$(DIST_DIR)/asciidoc_tables.html \
$(DIST_DIR)/diagram-graphviz.html \
$(DIST_DIR)/diagram-plantuml.html \
$(DIST_DIR)/install_asciidoctor.html \
$(DIST_DIR)/math_font_chars.html \
$(DIST_DIR)/math_font_symbols.html \
$(DIST_DIR)/syntax_highlighting.html \
$(DIST_DIR)/unicode_font_arrows.html \
$(DIST_DIR)/index.html

SUB_TARGETS=\
math

.PHONY: adoc mkdir_and_copy $(SUB_TARGETS)

adoc: $(HTML_LIST) $(SUB_TARGETS)

mkdir_and_copy:
	mkdir -p $(DIST_DIR)
	-test -d $(DST_IMAGES_DIR) || mkdir -p $(DST_IMAGES_DIR)
	-test ! -d $(SRC_IMAGES_DIR) || cp $(CP_OPTS) $(SRC_IMAGES_DIR)/* $(DST_IMAGES_DIR)/

$(DIST_DIR)/%.html: %.adoc header.adoc
	asciidoctor --trace $(AD_OPTS_HTML5_ROUGE) -o "$@" "$<"

math:
	(cd $@ && make adoc)
