.PHONY: test build
test:
	wasm32-wasi-ghc hello.hs -o hello.wasm

build:
	wasm32-wasi-ghc src/browser_utils.hs -o interfaces/wasm/browser_utils.wasm -no-hs-main -optl-mexec-model=reactor -optl-Wl,--export=hs_init,--export=add

