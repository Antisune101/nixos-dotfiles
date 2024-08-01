{ config, pkgs, inputs, ... }: {
  imports =
    [ 
      ./hardware-configuration.nix
      ./nixosModules/audio-config.nix
      ./nixosModules/bluetooth.nix
      ./nixosModules/system-utils.nix
      ./nixosModules/stylix.nix
      ./nixosModules/desktop-apps.nix
      ./nixosModules/gaming.nix
      ./nixosModules/programming/programming.nix

      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics.enable = true;

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
    
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs;  };
    users.antisune = import ./home-managerModules/home.nix;
    backupFileExtension = "backup";
  };
  
  users.users.antisune = {
    isNormalUser = true;
    description = "Ewan Bester";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    swaynotificationcenter
    libnotify
    xdg-desktop-portal-hyprland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    grim
    slurp
    swappy
    networkmanagerapplet
    swww
    pavucontrol
    rclone
    appimage-run
    bottles
    wine
    winetricks
    dxvk
    goverlay
  ];

  programs = {
    zsh.enable = true;
    
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    appimage.enable = true;

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
