VERSION ?= "SNAPSHOT"
REPO    ?= "klakegg/github-upload"

build:
	@docker build --no-cache -t $(REPO):snapshot .

prepare:
	@VERSION="$(VERSION)" \
		REPO="$(REPO)" \
		sh script/prepare.sh

publish: prepare
	@VERSION="$(VERSION)" \
		REPO="$(REPO)" \
		sh script/publish.sh
