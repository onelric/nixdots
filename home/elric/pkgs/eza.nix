{ pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--git"
      "--icons"
      "--color-scale" 
      "--color-scale-mode=fixed"
    ];
  };
}
