{ config, pkgs, ... }:

{
    # Custom module configuration
    hyprland.enable = true;
    hyprland.monitors = "DP-1, 2736x1824, 0x0, auto";
    kanata.devices = [
        "/dev/input/by-path/pci-0000:00:14.0-usb-0:8:1.0-event-kbd"
        "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:8:1.0-event-kbd"
    ];


    imports =
        [ # Include the results of the hardware scan.
          ./hardware-configuration.nix
        ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.initrd.luks.devices."luks-89df95b0-7dfd-4e7f-a011-b51de21b0727".device = "/dev/disk/by-uuid/89df95b0-7dfd-4e7f-a011-b51de21b0727";
    networking.hostName = "nixos-surface"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Africa/Johannesburg";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_ZA.UTF-8";

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

    # Configure keymap in X11
        services.xserver.xkb = {
        layout = "za";
        variant = "";
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.antisune = {
        isNormalUser = true;
        description = "Ewan Bester ";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [ "flakes" "nix-command" ];
    system.stateVersion = "25.05"; # Did you read the comment?

}
