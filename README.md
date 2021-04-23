# docker-protoc

Run `protoc` with `docker`.

## Include

- [protobuf](https://github.com/protocolbuffers/protobuf)
- [protoc-gen-go](https://pkg.go.dev/google.golang.org/protobuf/cmd/protoc-gen-go)
- [protoc-gen-go-grpc](https://pkg.go.dev/google.golang.org/grpc/cmd/protoc-gen-go-grpc)
- [buf](https://github.com/bufbuild/buf)

## Install

```sh
IMAGE=image TAG=tag make build
```

## Use

`/home/docker/app` is mount point in docker container, because user is `docker` not `root`.

Need to replace `/path/to/output`, `/path/to/proto` with your path.

Need to replace `image`, `tag` with your docker image, tag.

**Lint**:

With `buf`:

Should include [buf.yaml](buf.yaml) file.

```sh
docker run --rm --volume $(pwd):/home/docker/app --workdir /home/docker/app image:tag \
    protoc \
        -I . \
        --buf-check-lint_out . \
        /path/to/proto
```

**Build**:

```sh
docker run --rm --volume $(pwd):/home/docker/app --workdir /home/docker/app image:tag \
    protoc \
        -I . \
        --go_out /path/to/output \
        --go-grpc_out /path/to/output \
        /path/to/proto
```

**Format**:

Should include [.clang-format](.clang-format) file.

```sh
docker run --rm --volume $(pwd):/home/docker/app --workdir /home/docker/app image:tag \
    clang-format -i \
        /path/to/proto
```
