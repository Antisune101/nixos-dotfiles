{self, inputs, ...}: {
  flake.nixosModules.gaming = { pkgs, lib, ... }: {
    nixpkgs.overlays = [ inputs.millennium.overlays.default ];

    hardware.graphics.enable = lib.mkDefault true;

    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        # package = pkgs.millennium-steam;
        protontricks.enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      # steam-run
      # dxvk
      # gamescope
      # mangohud
      # r2modman
      # heroic
      # steamtinkerlaunch
      # bottles
      prismlauncher
    ];

    nix.settings = {
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };
  };
}
