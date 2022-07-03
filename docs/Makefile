BASE_DIR=..
DIST_DIR=$(BASE_DIR)
OUTPUT_DIR_HTML=$(DIST_DIR)/html

include $(BASE_DIR)/asciidoc.mk

HTML_LIST=\
$(OUTPUT_DIR_HTML)/diagram-graphviz.html \
$(OUTPUT_DIR_HTML)/diagram-plantuml.html \
$(OUTPUT_DIR_HTML)/math.html \
$(OUTPUT_DIR_HTML)/index.html

.PHONY: adoc

adoc: $(HTML_LIST)

$(OUTPUT_DIR_HTML)/math.html: math.adoc
	mkdir -p $(OUTPUT_DIR_HTML)
	asciidoctor --trace $(AD_OPTS_HTML5_STEM) -o "$@" "$<"

$(OUTPUT_DIR_HTML)/%.html: %.adoc
	mkdir -p $(OUTPUT_DIR_HTML)
	asciidoctor --trace $(AD_OPTS_HTML5_ROUGE) -o "$@" "$<"
