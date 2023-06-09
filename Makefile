.PHONY: test lint wasirun

GO ?= go
GOPATH = $(shell $(GO) env GOPATH)

wasip1.test:
	GOARCH=wasm GOOS=wasip1 $(GO) test -c ./wasip1

test: wasirun wasip1.test
	wasirun wasip1.test -test.v

wasirun: $(GOPATH)/bin/wasirun

$(GOPATH)/bin/wasirun:
	$(GO) install github.com/stealthrocket/wasi-go/cmd/wasirun@latest
