{ config, pkgs, inputs, ... }: {
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/audio-config.nix
      ./modules/bluetooth.nix
      ./modules/lsp.nix
      ./modules/stylix/stylix.nix
      inputs.home-manager.nixosModules.default
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
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
    };

    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs;  };
    users.antisune = import ./home.nix;
  };
  
  users.users.antisune = {
    isNormalUser = true;
    description = "Ewan Bester";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    git
    helix
    lf
    fzf
    neofetch
    btop
    kitty
    rofi
    swaynotificationcenter
    libnotify
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
    brave
    vesktop
    godot_4
    gimp
    obsidian
    blender
    obs-studio
    libreoffice
    mangohud
    protonup
    speedcrunch
    gnome.gnome-calculator
    adwsteamgtk
    scrcpy
    localsend
    android-tools
    android-udev-rules
    niv
    pavucontrol

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

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?


}
