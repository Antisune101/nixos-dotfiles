# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
      ./modules/audio-config.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.opengl.enable = true;

  xdg = {
    portal.enable = true;
    portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-wlr ];
  };

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Configure keymap in X11
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "za";
        variant = "";
      };
        excludePackages = [ pkgs.xterm ];
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
      };
    };

    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    
  };

  home-manager.users.antisune = import ./home.nix;
  
  users.users.antisune = {
    isNormalUser = true;
    description = "Ewan Bester";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [   
      unstable.brave
      unstable.vesktop
      unstable.godot_4
      unstable.gimp
      unstable.obsidian
      unstable.blender
      unstable.obs-studio
      unstable.libreoffice
      unstable.mangohud
      unstable.protonup
      speedcrunch
      gnome.gnome-calculator
      adwsteamgtk
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    helix
    lf
    fzf
    broot
    neofetch
    btop
    kitty
    rofi
    unstable.swaynotificationcenter
    unstable.libnotify
    wl-clipboard
    xdg-desktop-portal-hyprland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    polkit_gnome
    xorg.xhost
    gparted
    mpv
    nsxiv
    grim
    slurp
    swappy
    networkmanagerapplet
    swww
    gnome.nautilus
    usbutils
    udiskie
    udisks

  ];

  programs = {
    zsh.enable = true;
    
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;

  };

  fonts.packages = with pkgs; [
    nerdfonts
  ];


  environment.sessionVariables = {
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    GTK_USE_PORTAL = "1";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/antisune/.steam/root/compatibilitytools.d";
  };


  system.autoUpgrade.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.stateVersion = "23.11"; # Did you read the comment?


}
