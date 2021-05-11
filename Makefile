# https://github.com/protocolbuffers/protobuf/releases
PROTOC_VERSION = 3.16.0

# https://github.com/bufbuild/buf/releases
BUF_VERISON = 0.41.0

# https://golang.org/doc/devel/release.html
GO_VERSION = 1.16.4

# https://github.com/protocolbuffers/protobuf-go/releases
PROTOC_GEN_GO_VERSION = 1.26.0

# https://github.com/grpc/grpc-go/releases
PROTOC_GEN_GO_GRPC_VERSION = 1.1.0

.PHONY: help check build push

help:
	@echo Read Makefile to understand

check:
ifeq ($(strip $(IMAGE)),)
	$(error Empty IMAGE)
endif

ifeq ($(strip $(TAG)),)
	$(error Empty TAG)
endif

build: check
	docker build \
	--tag $(IMAGE):$(TAG) \
	--build-arg PROTOC_VERSION=$(PROTOC_VERSION) \
	--build-arg BUF_VERISON=$(BUF_VERISON) \
	--build-arg GO_VERSION=$(GO_VERSION) \
	--build-arg PROTOC_GEN_GO_VERSION=$(PROTOC_GEN_GO_VERSION) \
	--build-arg PROTOC_GEN_GO_GRPC_VERSION=$(PROTOC_GEN_GO_GRPC_VERSION) \
	.

push: build
	docker push $(IMAGE):$(TAG)
