{
  pkgs,
  zen-browser,
  ...
}: 
{
  imports = [
    ./fonts.nix
    ../pkgs/rofi
    ../pkgs/eww
    ../pkgs/kitty
  ];

  home.packages =  [
    pkgs.rofi

    pkgs.spotify
    pkgs.discord
    pkgs.kitty
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    pkgs.wl-clipboard
    pkgs.wlprop

    pkgs.brightnessctl
    pkgs.playerctl
    pkgs.pamixer
    pkgs.libnotify
    pkgs.mako

    # Json parser for switch workspace script
    pkgs.jq
  ];


  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };
}
