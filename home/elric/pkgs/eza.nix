{ pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = true;
    extraOptions = [
      "--git"
      "--icons"
      "--color-scale" 
      "--color-scale-mode=fixed"
    ];
  };
}
