RM=rmx

all: rebuild_bins rebuild_libs_release

rebuild_bins: clean build_bins

rebuild_bins_release: clean build_bins_release

rebuild_libs: clean build_libs

rebuild_libs_release: clean build_libs_release


build_bins:
	go build -tags "debug" -o ./output/bins/ ./cmd/go_develop_template

build_bins_release:
	go build -o ./output/bins/ ./cmd/go_develop_template

build_libs:
	go build -tags "debug" -buildmode=c-shared -o ./output/libs/libdy1.so libs/lib1.go libs/lib2.go
	go build -tags "debug" -buildmode=c-archive -o ./output/libs/libst1.a libs/lib1.go libs/lib2.go

build_libs_release:
	go build -buildmode=c-shared -o ./output/libs/libdy1.so libs/lib1.go libs/lib2.go
	go build -buildmode=c-archive -o ./output/libs/libst1.a libs/lib1.go libs/lib2.go

install_tools:
	go install golang.org/x/tools/cmd/goimports@latest
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	go install github.com/braswelljr/rmx@latest

install:
	go mod tidy -v
	go get ./...

update:
	go mod tidy -v
	go get -u ./...
	# go get -u all

run:
	go run cmd/go_develop_template/main.go

clean:
	- $(RM) output
	go clean -testcache

fmt:
	# go fmt ./...
	# goimports -l -w .
	go fmt ./cmd/...
	go fmt ./libs/...
	go fmt ./tests/...
	goimports -l -w ./cmd
	goimports -l -w ./libs
	goimports -l -w ./tests

lint:
	# golangci-lint run -c .golangci.json -v ./...
	golangci-lint run -c .golangci.json -v ./cmd/...
	golangci-lint run -c .golangci.json -v ./libs/...
	golangci-lint run -c .golangci.json -v ./tests/...

test:
	go test -v ./tests/...

bench:

coverage:
