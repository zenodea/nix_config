{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
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

  outputs = inputs@{ nixpkgs, home-manager, rust-overlay, ... }: {
    nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          ./configuration.nix

          ({ pkgs,  ... }: {
            nixpkgs.overlays = [rust-overlay.overlays.default ];
            environment.systemPackages = [pkgs.rust-bin.stable.latest.default ];
          })

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.zenodea = import ./home-manager/home.nix;
          }
        ];
      };
    };
  };
}
