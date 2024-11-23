.PHONY: test build_wasm server build

test:
	wasm32-wasi-ghc hello.hs -o hello.wasm

build:
	stack build

build_wasm:
	wasm32-wasi-ghc src/browser_utils.hs -o web/wasm/browser_utils.wasm -no-hs-main -optl-mexec-model=reactor -optl-Wl,--export=hs_init,--export=add

server:
	stack run