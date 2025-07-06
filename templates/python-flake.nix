{
  description = "Python development environment";

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
        python = pkgs.python311;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            python
            python311Packages.pip
            python311Packages.virtualenv
            python311Packages.pytest
            python311Packages.black
            python311Packages.flake8
            python311Packages.mypy
            python311Packages.pylint
          ];

          shellHook = ''
            echo "Python development environment"
            echo "Python version: $(python --version)"
            echo "Pip version: $(pip --version)"
            
            # Create virtual environment if it doesn't exist
            if [ ! -d "venv" ]; then
              echo "Creating virtual environment..."
              python -m venv venv
            fi
            
            echo "Activate with: source venv/bin/activate"
          '';
        };
      });
}