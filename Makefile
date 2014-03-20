# Reference card for usual actions in development environment.
#

NPM = npm
BIN_DIR = node_modules/.bin
BOWER = $(BIN_DIR)/bower
GRUNT = $(BIN_DIR)/grunt
GHP = ghp-import


.PHONY: help develop bower watch public clean dist-clean maintainer-clean gh-pages-commit gh-pages-push


#: help - Display available targets.
help:
	@echo "Reference card for usual actions in development environment."
	@echo "Here are available targets:"
	@egrep -o "^#: (.+)" [Mm]akefile  | sed 's/#: /* /'


#: develop - Install development libraries.
develop:
	$(NPM) install
	pip install ghp-import


#: bower - Download libraries with bower.
bower:
	$(BOWER) install


#: watch - Watch in-development files and automatically build them on update.
watch:
	$(GRUNT) watch


#: public - Generate public/ folder contents.
public: bower
	$(GRUNT) copy less uglify


#: serve - Serve public/ folder on localhost:8000
serve:
	cd public/ && python -m SimpleHTTPServer


#: clean - Basic cleanup, mostly temporary files.
clean:


#: distclean - Remove local builds
dist-clean: clean
	rm -rf public/
	rm -rf bower_components/


#: maintainer-clean - Remove almost everything that can be re-generated.
maintainer-clean: dist-clean
	rm -rf node_modules/


#: gh-pages-commit - Commit generated website into gh-pages branch.
gh-pages-commit:
	$(GHP) -n public/


# gh-pages-push - Travis pushes gh-pages branch on Github.
gh-pages-push:
	@git push -fq https://${GH_TOKEN}@github.com/$(TRAVIS_REPO_SLUG).git gh-pages > /dev/null
