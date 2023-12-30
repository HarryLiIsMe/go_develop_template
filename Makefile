all: rebuild

rebuild: clean build

rebuild_release: clean build_release

build: 
	go build -tags "debug" -o ./bin/ ./cmd/test

build_release: 
	go build -o ./bin/ ./cmd/test

install:
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.55.2

update:
	go mod tidy
	go get -u
	
clean:
	rm -rf bin/*
	go clean -testcache 
	
fmt:
	go fmt ./...

lint:
	golangci-lint run -v ./...

test:
	go test -v ./...
