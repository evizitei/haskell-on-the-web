{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [
      (builtins.getFlake "gitlab:ghc/ghc-wasm-meta?host=gitlab.haskell.org").packages.${pkgs.system}.default
      pkgs.deno
      pkgs.ghc
      pkgs.stack
      pkgs.zlib
    ];
}