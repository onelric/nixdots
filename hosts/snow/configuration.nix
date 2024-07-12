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

  users.users.elric = {
    isNormalUser = true;
    home = "/home/elric";
    description = "elric";
    extraGroups = [ "wheel" "audio" "video" ];
  };

  environment.systemPackages = with pkgs; [
    vim 
    wget
    git
    git-crypt
    cargo
    gcc
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.sway.enable = true;

  system.stateVersion = "24.05";  # Sync with home-manager
}

