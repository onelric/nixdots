{ pkgs, ... }:
{
  imports = [
    ./shells/bash.nix
    ./shells/zsh.nix
    ./pkgs/yazi.nix
    ./pkgs/eza.nix
    ./pkgs/neovim
    ./pkgs/mako.nix
    ./wm/niri
    ./wm
  ];

  home.username = "elric";
  home.homeDirectory = "/home/elric";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = "/home/elric/.config";
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
    wiremix
    fastfetch

    btop
    (writeShellScriptBin "fetchnip" ''
      exec $HOME/nixdots/home/$USER/pkgs/fetchnip "$@"
    '')

    # Development :O
    love
    aseprite

    # Lsp's
    lua-language-server
    vscode-langservers-extracted
    # Language tools
    clang
    clang-tools
    gnumake
    nixd

    # Cool scripts
    yazi
    zscroll
    highlight
    zoxide
    bc
    nh
  ];

  programs.home-manager.enable = true;
}
