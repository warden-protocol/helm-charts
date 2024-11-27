SHELL=/bin/bash

UID := $(shell id -u)
CURRENT_DIR := $(shell pwd)

.PHONY: init lint unit docs clean

init:
	@pre-commit install

lint:
	@docker run --rm --workdir /charts --volume "$(CURRENT_DIR):/charts" -u $(UID) -e "HOME=/tmp" quay.io/helmpack/chart-testing:v3.11.0 sh -ac 'chown ${UID} .; exec ct lint'

unit:
	@docker run --rm --workdir /charts --volume "$(CURRENT_DIR):/charts" -u $(UID) -e "HOME=/tmp" helmunittest/helm-unittest -f 'tests/unit/*_test.yaml' charts/*

docs:
	@docker run --rm --volume "$(CURRENT_DIR):/helm-docs" -u $(UID) jnorwood/helm-docs:v1.14.2

clean:
	@pre-commit uninstall
