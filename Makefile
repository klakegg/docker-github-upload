VERSION ?= "SNAPSHOT"
REPO    ?= "klakegg/github-upload"

build:
	@docker build -t $(REPO):snapshot .

prepare:
	@VERSION="$(VERSION)" \
		REPO="$(REPO)" \
		sh script/prepare.sh

publish:
	@VERSION="$(VERSION)" \
		REPO="$(REPO)" \
		sh script/publish.sh
