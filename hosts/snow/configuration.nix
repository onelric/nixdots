# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./wpa.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking & Timezone
  time.timeZone = "Europe/Stockholm";

  # Set locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "sv-latin1";
  };

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Define user
  users.users.elric = {
    isNormalUser = true;
    home = "/home/elric";
    description = "elric";
    extraGroups = [ "wheel" "audio" "video" "adbusers" ];
  };

  # Set environment variables
  environment.sessionVariables = {
    FLAKE = "/home/elric/nixdots/";
    LIBVA_DRIVER_NAME = "iHD";
    DEFAULT_BROWSER = "${pkgs.brave}/bin/brave";
  };

  environment.variables = { ROC_ENABLE_PRE_VEGA = "1"; };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
        intel-compute-runtime
        intel-media-driver
        intel-vaapi-driver
        opencl-headers
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.steam.enable = true;
  programs.nix-ld.enable = true;

  xdg.mime.defaultApplications = {
    "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/about" = "brave-browser.desktop";
      "x-scheme-handler/unknown" = "brave-browser.desktop";
  };

  # Pakagas
  environment.systemPackages = with pkgs; [
    xdg-utils
    vaapiIntel
    vim 
    wget
    git
    git-crypt
    rustup
    gcc
    iwd
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.sway.enable = true;

  system.stateVersion = "24.05";
}

