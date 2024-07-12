{
  description = "Elric's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: 
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

  in{
    nixosConfigurations = {
      snow = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/snow/configuration.nix
        ];
      };
    };
    homeConfigurations = {
      elric = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/elric/home.nix ];
      };
    };
  };
}
