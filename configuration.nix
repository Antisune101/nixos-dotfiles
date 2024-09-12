# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_ZA.UTF-8";
    LC_IDENTIFICATION = "en_ZA.UTF-8";
    LC_MEASUREMENT = "en_ZA.UTF-8";
    LC_MONETARY = "en_ZA.UTF-8";
    LC_NAME = "en_ZA.UTF-8";
    LC_NUMERIC = "en_ZA.UTF-8";
    LC_PAPER = "en_ZA.UTF-8";
    LC_TELEPHONE = "en_ZA.UTF-8";
    LC_TIME = "en_ZA.UTF-8";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.antisune = {
    isNormalUser = true;
    description = "Ewan Bester";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    neofetch
    btop
    protonup
    heroic
    swww
    hyprpaper
    waybar
    # Audio
    wireplumber
    playerctl

    yazi

    # Desktop Apps
    godot_4
    brave
    nemo
    obsidian


    # USB utils
    usbutils
    udiskie
    udisks
  ];
  security.rtkit.enable = true;


  # List programs that you want to enable:
  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    steam.enable = true;
    gamemode.enable = true;
  };

  # List services that you want to enable:
  services = {
    displayManager.ly = {
      enable = true;
      package = pkgs.ly;
    };
    xserver = {
      videoDrivers = ["amdgpu"];
      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    gvfs.enable = true;
    udisks2.enable = true;
  };

  # Hardware settings
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
    image = ./image.png;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 12;
    };
  };



  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
