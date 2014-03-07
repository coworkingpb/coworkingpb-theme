# Reference card for usual actions in development environment.
#

NPM = npm
BIN_DIR = node_modules/.bin
BOWER = $(BIN_DIR)/bower
GRUNT = $(BIN_DIR)/grunt


.PHONY: help develop bower watch public clean dist-clean maintainer-clean


#: help - Display available targets.
help:
	@echo "Reference card for usual actions in development environment."
	@echo "Here are available targets:"
	@egrep -o "^#: (.+)" [Mm]akefile  | sed 's/#: /* /'


#: develop - Install development libraries.
develop:
	$(NPM) install


#: bower - Download libraries with bower.
bower:
	$(BOWER) install


#: watch - Watch in-development files and automatically build them on update.
watch:
	$(GRUNT) watch


#: public - generate public/ folder contents.
public: bower
	$(GRUNT) copy less uglify


#: clean - Basic cleanup, mostly temporary files.
clean:


#: distclean - Remove local builds
dist-clean: clean
	rm -rf public/
	rm -rf bower_components/


#: maintainer-clean - Remove almost everything that can be re-generated.
maintainer-clean: dist-clean
	rm -rf node_modules/
