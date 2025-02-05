PKG_LIST := $(shell go list ./...)

.PHONY: build
build:
	go build -race -o bin/hello-world main.go

.PHONY: run
run: build
	./bin/hello-world

.PHONY: lint-test
lint-test:
	golangci-lint run -v

.PHONY: fmt-test
fmt-test:
	go fmt ${PKG_LIST}

.PHONY: vet-test
vet-test:
	go vet ${PKG_LIST}

.PHONY: unit-test
unit-test:
	go test -v ${PKG_LIST} -count=1 -timeout=10s

.PHONY: race-test
race-test:
	go test -race -short ${PKG_LIST}  -count=1 -timeout=10s
