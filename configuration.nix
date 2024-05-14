# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
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

  # Enable audio
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


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
      };
    };

    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.antisune = {
    isNormalUser = true;
    description = "Ewan Bester";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    steam.enable = true;
  };

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    helix
    lf
    fzf
    neofetch
    btop
    kitty
    rofi
    unstable.swaynotificationcenter
    unstable.libnotify
    wireplumber
    playerctl
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
    nwg-look
    gnome.nautilus
    usbutils
    udiskie
    udisks
    unstable.hyprlock

  ];


  environment.sessionVariables = {
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    GTK_USE_PORTAL = "1";
  };


  system.autoUpgrade.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?


}
