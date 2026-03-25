{
  pkgs,
  niri,
  ...
}: 
{
  imports = [
    ../../pkgs/eww
  ];

  home.packages = with pkgs; [
    niri.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite
    swaybg
    wl-clipboard
    wf-recorder
    wlprop
    eww
  ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
}
