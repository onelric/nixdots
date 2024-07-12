{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = "zsh";
  };
}
