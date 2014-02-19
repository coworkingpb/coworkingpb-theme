.PHONY: help watch generate clean dist-clean maintainer-clean
NPM ?= npm
BIN_DIR ?= node_modules/.bin
BOWER ?= $(BIN_DIR)/bower
GRUNT ?= $(BIN_DIR)/grunt


# target: all - Install libraries and generate static files.
all: develop public/index.html


# target: help - Display available targets.
help:
	@echo "Here are available targets:"
	@egrep -o "^# target:(.+)" [Mm]akefile  | sed 's/target: //'


# target: develop - Install development libraries.
develop:
	$(NPM) install


# Download libraries with bower.
bower:
	$(BOWER) install


# Watch in-development files.
watch:
	$(GRUNT) watch


# generate public/ folder contents.
public/index.html: bower
	$(GRUNT) copy less uglify


clean:


dist-clean: clean
	rm -rf public/
	rm -rf bower_components/


maintainer-clean: dist-clean
	rm -rf node_modules/
