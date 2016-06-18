PACKER_TEMPLATES := $(wildcard */*.json)

PACKER ?= packer
PACKER_VERSION ?= 0.10.1

SHELL := /bin/bash
export PATH := $(PATH):$(shell pwd)/bin

.PHONY: test
test: $(PACKER_TEMPLATES)
	@echo $<

%.zip:
	@wget https://releases.hashicorp.com/packer/$(PACKER_VERSION)/$@

bin/$(PACKER): | packer_$(PACKER_VERSION)_linux_amd64.zip
	@unzip $| -d bin
	$(PACKER) version

.FORCE:
%.json: bin/$(PACKER) .FORCE
	cd $(@D); \
	$(PACKER) validate $(@F)
