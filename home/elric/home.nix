{ pkgs, ... }:

{
  imports = [
    ./shells/bash.nix
    ./shells/zsh.nix
    ./pkgs/yazi.nix
    ./pkgs/eza.nix
    ./pkgs/neovim
    ./wm/sway
  ];

  home.username = "elric";
  home.homeDirectory = "/home/elric";
  home.stateVersion = "24.05"; # Sync this with /etc/nixos/configuration.nix

  fonts.fontconfig.enable = true;

  # Allow unfree packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.packages = with pkgs; [
    highlight
    yazi
    zsh
    unzip
    python3
    zscroll
    nh
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
