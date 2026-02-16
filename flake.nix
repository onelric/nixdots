{
  description = "Elric's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, neovim-nightly-overlay, home-manager }@inputs: 
    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstable = import nixpkgs-unstable {
        inherit system;
        overlays = [
          neovim-nightly-overlay.overlays.default
        ];
      };
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
          extraSpecialArgs = {inherit unstable;};
          modules = [ 
            ./home/elric/home.nix 
          ];
        };
      };
    };
}
