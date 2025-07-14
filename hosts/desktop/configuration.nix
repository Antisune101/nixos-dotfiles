{ config, pkgs, ... }:

{
  # Custom module configuration
  hyprland.enable = true;
    hyprland.monitor = "DP-1, 1920x1080@180, 0x0, auto";
  kanata.devices = [
    "/dev/input/by-path/pci-0000:12:00.3-usb-0:2:1.1-event-kbd"
    "/dev/input/by-path/pci-0000:12:00.3-usbv2-0:2:1.1-event-kbd"
    "/dev/input/by-path/pci-0000:12:00.4-usb-0:2:1.0-event-kbd"
   "/dev/input/by-path/pci-0000:12:00.4-usb-0:2:1.1-event-kbd"
   "/dev/input/by-path/pci-0000:12:00.4-usbv2-0:2:1.0-event-kbd"
    "/dev/input/by-path/pci-0000:12:00.4-usbv2-0:2:1.1-event-kbd"
    ];


  imports = [
    ./hardware-configuration.nix
  ];



  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-pc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "za";
    variant = "";
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

  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  system.stateVersion = "25.05"; # Did you read the comment? Yes I did :)

}
