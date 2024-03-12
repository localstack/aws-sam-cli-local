VENV_DIR ?= .venv
PIP_CMD ?= python3 -m pip
VENV_RUN = . $(VENV_DIR)/bin/activate
VENV_OPTS ?=

usage:             ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

setup-venv:
	(test -e $(VENV_DIR) || python3 -m venv $(VENV_OPTS) $(VENV_DIR))

install:           ## Install full dependencies in virtualenv
	make setup-venv && \
		(test ! -e requirements.txt || ($(VENV_RUN); $(PIP_CMD) install -e .[dev])) || exit 1

publish:           ## Publish the library to the central PyPi repository
	# build and upload archive
	($(VENV_RUN) && python setup.py sdist; $(PIP_CMD) install twine; twine upload dist/*.tar.gz)

lint:              ## Run code linter to check code style
	($(VENV_RUN); flake8 --show-source --ignore=E128,W504,E501,F401 --exclude=node_modules,$(VENV_DIR)*,dist,fixes,tmp . bin/samlocal)

.PHONY: usage clean install publish lint
