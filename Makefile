VERSION ?= "SNAPSHOT"

build:
	@docker build -t github-upload .

prepare:
	@VERSION=$(VERSION) sh script/prepare.sh

publish:
	@VERSION=$(VERSION) sh script/publish.sh
