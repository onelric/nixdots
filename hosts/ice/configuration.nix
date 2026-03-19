# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Downgraded kernal due to driver issues with NVIDIA, like usual..
  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.kernelModules = [ "k10temp" "amd64_edac_mod" ];
  boot.kernelParams = [ "numa_balancing=1" "nmi_watchdog=0" "nvidia-drm.modeset=1" ];
  # Make compiling the os faster
  security.tpm2.enable = false;

  hardware.cpu.amd.updateMicrocode = true;

  # Alt, "ondemand" & "performance"
  powerManagement.cpuFreqGovernor = "schedutil";

  # Networking & Timezone
  time.timeZone = "Europe/Stockholm";
  networking = {
    wireless.iwd.enable = true;
    hostName = "ice";
    networkmanager = {
      enable = true;
      wifi = {
        powersave = false;
        scanRandMacAddress = false;
      };
    };
  };

  # Set locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "sv-latin1";
  };

  # Enable bluetooth
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    nvidia = {
      nvidiaSettings = true;
      open = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
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
    NH_FLAKE = "/home/elric/nixdots/";
    LIBVA_DRIVER_NAME = "iHD";
    DEFAULT_BROWSER = "${pkgs.brave}/bin/brave";
  };

  environment.variables = { 
    ROC_ENABLE_PRE_VEGA = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER = "vulkan"; 
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_SYNC_TO_VBLANK = "0";
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
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
    vim 
    wget
    git
    git-crypt
    rustup
    gcc
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'sway --unsupported-gpu'";
        user = "greeter";
      };
    };
  };

  programs.sway.enable = true;
  
  system.stateVersion = "25.11";
}

