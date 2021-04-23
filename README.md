# docker-protoc

Run `protoc` with `docker`.

## Include

- [protobuf](https://github.com/protocolbuffers/protobuf)
- [protoc-gen-go](https://github.com/protocolbuffers/protobuf-go)
- [protoc-gen-go-grpc](https://github.com/grpc/grpc-go)
- [buf](https://github.com/bufbuild/buf)

## Install

```sh
IMAGE=image TAG=tag make build
```

## Use

`/home/docker/app` is mount point in docker container, because user is `docker` not `root`.

Need to replace `/path/to/output`, `/path/to/proto` with your real path.

Need to replace `image`, `tag` with your custom.

### Build

```sh
docker run --rm --volume $(pwd):/home/docker/app --workdir /home/docker/app image:tag \
    protoc \
        -I . \
        --go_out /path/to/output \
        --go-grpc_out /path/to/output \
        /path/to/proto
```

### Lint

With `buf`:

Should include [buf.yaml](https://docs.buf.build/configuration/) file.

```sh
docker run --rm --volume $(pwd):/home/docker/app --workdir /home/docker/app image:tag \
    protoc \
        -I . \
        --buf-check-lint_out . \
        /path/to/proto
```

### Format

Should include [.clang-format](https://clang.llvm.org/docs/ClangFormatStyleOptions.html) file.

```sh
docker run --rm --volume $(pwd):/home/docker/app --workdir /home/docker/app image:tag \
    clang-format -i \
        /path/to/proto
```
