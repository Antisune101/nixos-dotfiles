{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
      ./modules/audio-config.nix
      ./modules/bluetooth.nix
      ( import ./modules/lsp.nix { inherit pkgs unstable; })
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
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    unstable.helix
    lf
    fzf
    neofetch
    btop
    kitty
    rofi
    unstable.swaynotificationcenter
    unstable.libnotify
    wl-clipboard
    unstable.xdg-desktop-portal-hyprland
    unstable.xdg-utils
    unstable.xdg-desktop-portal
    unstable.xdg-desktop-portal-gtk
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
    unstable.gnome.nautilus
    usbutils
    udiskie
    udisks
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
    scrcpy
    localsend
    android-tools
    android-udev-rules

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

    adb.enable = true;

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
