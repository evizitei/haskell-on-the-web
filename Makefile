.PHONY: test
test:
	wasm32-wasi-ghc hello.hs -o hello.wasm
