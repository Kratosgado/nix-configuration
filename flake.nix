{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # specialArgs = { inherit self; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            # nixpkgs.overlays = [ (import ./overlays/pinned-packages.nix) ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.kratosgado = import ./home.nix;
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit inputs; };
            };
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
      };
    };
  };
}
