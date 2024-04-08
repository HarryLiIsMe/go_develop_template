all: rebuild

rebuild: clean build

rebuild_release: clean build_release

build: 
	go build -tags "debug" -o ./bin/ ./cmd/go_develop_template

build_release: 
	go build -o ./bin/ ./cmd/go_develop_template

install:
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	go install github.com/braswelljr/rmx@latest
	
update:
	go mod tidy
	go get -u ./...
	# go get -u all
	
clean:
	rmx bin/*
	go clean -testcache 
	
fmt:
	go fmt ./... 

lint:
	golangci-lint run -c .golangci.json -v ./...

test:
	go test -v ./tests/...
