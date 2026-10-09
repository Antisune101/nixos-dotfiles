{ self, inputs, ...}: {
  flake.nixosConfigurations.surface = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.surfaceConfig ];
  };

  flake.nixosModules.surfaceConfig = { pkgs, config, ... }: {
    imports =
      [ # Include the results of the hardware scan.
        self.nixosModules.surfaceHardware
        self.nixosModules.base
        self.nixosModules.general
        self.nixosModules.gaming
        self.nixosModules.desktop
        self.nixosModules.orca-slicer
        self.nixosModules.syncthing
      ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos"; # Define your hostname.

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Africa/Johannesburg";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_ZA.UTF-8";

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };


    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.05"; # Did you read the comment?

  };
}
