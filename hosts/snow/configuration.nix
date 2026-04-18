{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "snow"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "sv-latin1";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.pipewire = {
     enable = true;
     pulse.enable = true;
     wireplumber.enable = true;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      intel-vaapi-driver
      opencl-headers
    ];
  };

  users.users.elric = {
    isNormalUser = true;
    home = "/home/elric";
    description = "elric";
    extraGroups = [ "wheel" "audio" "video" "network" ]; 
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  environment.sessionVariables = {
    FLAKE = "/home/elric/nixdots/";
    NH_FLAKE = "/home/elric/nixdots/";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.steam.enable = true;
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    killall
    vim
    wget
    git
    gcc
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'niri-session'";
        user = "greeter";
      };
    };
  };

  programs.xwayland.enable = true;
  programs.niri = {
    enable = true;
    package = inputs.niri-wip.packages.${pkgs.stdenv.hostPlatform.system}.default;
    # niri.packages.${pkgs.stdenv.hostPlatform.system}.default
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}

