GIT_COMMIT:=$(shell git rev-parse --short HEAD)
IMAGE:=siteshjalan/apollo-workshop-jalans
.PHONY: build
build: Dockerfile
	docker build -t $(IMAGE) .

.PHONY: push
push: build
	docker tag siteshjalan/apollo-workshop $(IMAGE):$(GIT_COMMIT)
	docker push $(IMAGE):$(GIT_COMMIT)

.PHONY: test
test: build
	bin/apollo validate

.PHONY: deploy
deploy: push
	bin/apollo deploy -e production -m bikroy -t $(GIT_COMMIT)
