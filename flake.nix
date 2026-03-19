{
  description = "Elric's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    swayfx.url = "github:WillPower3309/swayfx";
    zen-browser.url = "github:youwen5/zen-browser-flake";


    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager,
             neovim-nightly-overlay, swayfx, zen-browser, 
  }@inputs: 
    let 
      system = "x86_64-linux";
      unstable = import nixpkgs-unstable {
        inherit system;
        overlays = [
          neovim-nightly-overlay.overlays.default
        ];
      };

      pkgs = import nixpkgs {
        system = system;
      };
    in{
      nixosConfigurations = {
        ice = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/ice/configuration.nix
            home-manager.nixosModules.home-manager
            {
                # home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { 
                inherit unstable; 
                inherit swayfx; 
                inherit zen-browser;
              };
              home-manager.users.elric = import ./home/elric/home.nix;
            }
          ];
        };
      };
    };
}
