{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Required, nvf works best and only directly supports flakes
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  # outputs = { nixpkgs, home-manager, nvf, ... }: let
  #   system = "x86_64-linux";
  #   pkgs = nixpkgs.legacyPackages.${system};
  # in {
  #   # ↓ this is your home output in the flake schema, expected by home-manager
  #   "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
  #     inherit pkgs;
  #     modules = [
  #       nvf.homeManagerModules.default # <- this imports the home-manager module that provides the options
  #       ./home.nix # <- your home entrypoint, `programs.nvf.*` may be defined here
  #     ];
  #   };
  # };
  outputs = inputs@{ nixpkgs, nvf, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          nvf.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO replace ryan with your own username
            home-manager.users.kratosgado = import ./home.nix;
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };
  };
}
