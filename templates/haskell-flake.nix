{
  description = "Haskell development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            ghc
            cabal-install
            stack
            haskell-language-server
            hlint
            ormolu
            haskellPackages.fast-tags
            haskellPackages.hasktags
          ];

          shellHook = ''
            echo "Haskell development environment"
            echo "GHC version: $(ghc --version)"
            echo "Cabal version: $(cabal --version | head -n1)"
            echo "Stack version: $(stack --version | head -n1)"
          '';
        };
      });
}