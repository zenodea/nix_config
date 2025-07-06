{
  description = "Go development environment";

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
            go
            gopls
            gotools
            go-tools
            golangci-lint
            delve
            air
          ];

          shellHook = ''
            echo "Go development environment"
            echo "Go version: $(go version)"
            echo "golangci-lint version: $(golangci-lint --version | head -n1)"
            
            export GOPATH=$HOME/go
            export PATH=$GOPATH/bin:$PATH
          '';
        };
      });
}