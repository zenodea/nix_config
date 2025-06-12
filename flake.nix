{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
    };

  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, nix-darwin, rust-overlay, ... }: {
    darwinConfigurations."Zenos-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin"; # or x86_64-darwin
      modules = [
        ./hosts/darwin/configuration.nix

        ({ pkgs,  ... }: {
          nixpkgs.overlays = [rust-overlay.overlays.default ];
          environment.systemPackages = [pkgs.rust-bin.stable.latest.default ];
        })


        home-manager.darwinModules.home-manager
        {
          users.users.zenodeangeli.home = "/Users/zenodeangeli";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.zenodeangeli = import ./home-manager/home_darwin.nix;
        }
      ];
    };

    nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          ./hosts/nixos/configuration.nix

          ({ pkgs,  ... }: {
            nixpkgs.overlays = [rust-overlay.overlays.default ];
            environment.systemPackages = [pkgs.rust-bin.stable.latest.default ];
          })

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.zenodea = import ./home-manager/home_nixos.nix;
          }
        ];
      };
    };
  };
}
