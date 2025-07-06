{
  description = "JavaScript development environment";

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
            nodejs_20
            yarn
            nodePackages.npm
            nodePackages.typescript
            nodePackages.eslint
            nodePackages.prettier
            nodePackages.typescript-language-server
            nodePackages.vscode-langservers-extracted
          ];

          shellHook = ''
            echo "JavaScript development environment"
            echo "Node.js version: $(node --version)"
            echo "npm version: $(npm --version)"
            echo "Yarn version: $(yarn --version)"
            echo "TypeScript version: $(tsc --version)"
          '';
        };
      });
}