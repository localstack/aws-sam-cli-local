VENV_DIR ?= .venv
PIP_CMD ?= pip
VENV_RUN = . $(VENV_DIR)/bin/activate

usage:             ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

setup-venv:
	(test `which virtualenv` || $(PIP_CMD) install --user virtualenv) && \
		(test -e $(VENV_DIR) || virtualenv $(VENV_OPTS) $(VENV_DIR))

install:           ## Install full dependencies in virtualenv
	make setup-venv && \
		(test ! -e requirements.txt || ($(VENV_RUN); $(PIP_CMD) -q install -r requirements.txt)) || exit 1

publish:           ## Publish the library to the central PyPi repository
	# build and upload archive
	($(VENV_RUN) && python setup.py sdist; $(PIP_CMD) install twine; twine upload dist/*.tar.gz)

lint:              ## Run code linter to check code style
	($(VENV_RUN); flake8 --show-source --max-line-length=100 --ignore=E128,W504 --exclude=node_modules,$(VENV_DIR)*,dist,fixes . bin/samlocal)

.PHONY: usage clean install publish lint
