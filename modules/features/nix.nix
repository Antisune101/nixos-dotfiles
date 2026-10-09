{ inputs, ... }: {
  flake.nixosModules.nix = { pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    environment.systemPackages = with pkgs; [
      nixd
      nil 
      nix-inspect
    ];
  };
}
