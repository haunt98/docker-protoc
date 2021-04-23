# https://github.com/protocolbuffers/protobuf/releases
PROTOC_VERSION = 3.15.8

# https://github.com/bufbuild/buf/releases
BUF_VERISON = 0.27.1

# https://golang.org/doc/devel/release.html
GO_VERSION = 1.15.2

# https://github.com/protocolbuffers/protobuf-go/releases
PROTOC_GEN_GO_VERSION = v1.25.0

# https://github.com/grpc/grpc-go/releases
PROTOC_GEN_GO_GRPC_VERSION = v1.0.0

# https://github.com/grpc-ecosystem/grpc-gateway/releases
GATEWAY_VERSION = v1.15.2

.PHONY: help test build push

help:
	@echo read Makefile to understand

test:
	@test $(IMAGE)
	@test $(TAG)

build: test
	docker build \
	--tag $(IMAGE):$(TAG) \
	--build-arg PROTOC_VERSION=$(PROTOC_VERSION) \
	--build-arg BUF_VERISON=$(BUF_VERISON) \
	--build-arg GO_VERSION=$(GO_VERSION) \
	--build-arg PROTOC_GEN_GO_VERSION=$(PROTOC_GEN_GO_VERSION) \
	--build-arg PROTOC_GEN_GO_GRPC_VERSION=$(PROTOC_GEN_GO_GRPC_VERSION) \
	--build-arg GATEWAY_VERSION=$(GATEWAY_VERSION) \
	.

push: build
	docker push $(IMAGE):$(TAG)