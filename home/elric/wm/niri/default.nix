{
  pkgs,
  niri-wip,
  ...
}: 
{
  imports = [
    ../../pkgs/eww
  ];

  nixpkgs.overlays = [
    (final: prev: {
        swaybg = prev.swaybg.overrideAttrs (oldAttrs: {
          version = "pr-87"; # optional, just for clarity

          src = prev.fetchFromGitHub {
            owner = "swaywm";
            repo = "swaybg";
            rev = "refs/pull/87/head";
            sha256 = "sha256-u+K1+1l9JXp3xu3yqy9AnhMlqCLk7EIY5O2HawaHCQ8=";
          };
        });
      })
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = "gnome";
        "org.freedesktop.portal.ScreenCast" = [
          "gnome"
        ];
      };
    };
  };

  home.packages = with pkgs; [
    # For some reason niri-session which is required for screensharing doesn't work on the latest wip branch
    # niri.packages.${pkgs.stdenv.hostPlatform.system}.default
    niri
    xwayland-satellite
    xdg-desktop-portal-gnome
    xdg-utils
    gnome-keyring
    alacritty
    vesktop
    swaybg
    wl-clipboard
    wf-recorder
    wlprop
    eww
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
