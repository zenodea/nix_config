{
  description = "C development environment";

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
            gcc
            gdb
            valgrind
            cmake
            make
            pkg-config
            clang-tools
            bear
            cppcheck
          ];

          shellHook = ''
            echo "C development environment"
            echo "GCC version: $(gcc --version | head -n1)"
            echo "Make version: $(make --version | head -n1)"
            echo "CMake version: $(cmake --version | head -n1)"
          '';
        };
      });
}