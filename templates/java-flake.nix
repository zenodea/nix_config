{
  description = "Java development environment";

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
            jdk17
            maven
            gradle
            jdt-language-server
            google-java-format
            checkstyle
          ];

          shellHook = ''
            echo "Java development environment"
            echo "Java version: $(java --version | head -n1)"
            echo "Maven version: $(mvn --version | head -n1)"
            echo "Gradle version: $(gradle --version | grep Gradle)"
            
            export JAVA_HOME=${pkgs.jdk17}
          '';
        };
      });
}