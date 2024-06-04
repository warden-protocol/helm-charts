SHELL=/bin/bash

UID := $(shell id -u)
CURRENT_DIR := $(shell pwd)

.PHONY: lint

lint:
	@docker run --rm --workdir /charts --volume "$(CURRENT_DIR):/charts" -u $(UID) -e "HOME=/tmp" quay.io/helmpack/chart-testing:v3.11.0 sh -ac 'chown ${UID} .; exec ct lint'
