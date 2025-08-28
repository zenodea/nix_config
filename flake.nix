{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nix-darwin, nixvim,... }: {
    darwinConfigurations."Zenos-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin"; # or x86_64-darwin
      modules = [
        ./hosts/darwin/configuration.nix

        home-manager.darwinModules.home-manager
        {
          users.users.zenodeangeli.home = "/Users/zenodeangeli";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

            home-manager.users.zenodeangeli = {
              imports= 
              [ 
                nixvim.homeModules.nixvim
                ./home-manager/home_darwin.nix
              ];
        };
        }
      ];
    };

    nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
                    # This ensures home-manager inherits the nixpkgs config from NixOS
            home-manager.users.zenodea = {
              imports= [ 
              nixvim.homeModules.nixvim
                ./home-manager/home_nixos.nix
              ];
            };
          }
        ];
      };
    };
  };
}
