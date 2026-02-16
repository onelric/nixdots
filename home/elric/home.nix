{ pkgs, ... }:
{
  imports = [
    ./shells/bash.nix
    ./shells/zsh.nix
    ./pkgs/yazi.nix
    ./pkgs/eza.nix
    ./pkgs/neovim
    ./pkgs/mako.nix
    ./wm/sway
  ];

  home.username = "elric";
  home.homeDirectory = "/home/elric";
  home.stateVersion = "24.05";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  fonts.fontconfig.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.packages = with pkgs; [
    zsh
    unzip
    mpv
    ffmpeg

    htop
    powertop
    (writeShellScriptBin "fetchnip" ''
      exec $HOME/nixdots/home/$USER/pkgs/fetchnip "$@"
    '')

    # Development :O
    love
    aseprite
    (python312.withPackages (p: 
      with p; [
      python312Packages.pygame-ce
      python312Packages.python-lsp-server
    ]))

    # Lsp's
    lua-language-server
    vscode-langservers-extracted
    # Language tools
    clang
    clang-tools
    gnumake

    # Cool scripts
    wpa_supplicant_gui
    yazi
    zscroll
    highlight
    zoxide
    bc
    nh
  ];

  programs.home-manager.enable = true;
}
