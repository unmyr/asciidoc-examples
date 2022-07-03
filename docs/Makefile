BASE_DIR=..
DEST_DIR=$(BASE_DIR)/dist
SRC_IMAGES_DIR=$(IMAGES_DIR)
DST_IMAGES_DIR=$(DEST_DIR)/$(IMAGES_DIR)

include $(BASE_DIR)/asciidoc.mk

HTML_LIST=\
$(DEST_DIR)/asciidoc_images.html \
$(DEST_DIR)/diagram-graphviz.html \
$(DEST_DIR)/diagram-plantuml.html \
$(DEST_DIR)/math.html \
$(DEST_DIR)/index.html

.PHONY: adoc

adoc: $(HTML_LIST)

$(DEST_DIR)/math.html: math.adoc header.adoc
	mkdir -p $(DEST_DIR)
	asciidoctor --trace $(AD_OPTS_HTML5_STEM) -o "$@" "$<"

$(DEST_DIR)/asciidoc_images.html: asciidoc_images.adoc header.adoc
	mkdir -p $(DEST_DIR)
	-test -d $(DST_IMAGES_DIR) || mkdir -p $(DST_IMAGES_DIR)
	-test ! -d $(SRC_IMAGES_DIR) || cp $(CP_OPTS) $(SRC_IMAGES_DIR)/* $(DST_IMAGES_DIR)/
	asciidoctor --trace $(AD_OPTS_HTML5_ROUGE) -o "$@" "$<"

$(DEST_DIR)/%.html: %.adoc header.adoc
	mkdir -p $(DEST_DIR)
	asciidoctor --trace $(AD_OPTS_HTML5_ROUGE) -o "$@" "$<"
