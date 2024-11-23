# Can I write browser stuff in haskell?

I mean, of course, people have been transpiling haskell to javascript for a long time,
but I want to play with haskell to wasm and see if it's easy enough to
do more regularly.

## Setup

Use nix, it's easy and cool.

https://nixos.org/download/

```bash
nix-shell
```

Easy right?  It has installed isolated versions of the things needed for this project.

Now build your environment for running the server: 

```bash
make build
```

## Compile your client side haskell:

```bash
make build_wasm
```

(file should end up in web/wasm/browser_utils.wasm)

## Run a static server

it's scotty, a haskell package.