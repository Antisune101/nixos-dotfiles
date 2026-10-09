{ self, ... }: {
  flake.nixosModules.general = { pkgs, ... }: {
    imports = [
      self.nixosModules.nix
      self.nixosModules.helix
      self.nixosModules.git
    ];

    users.users."ebester" = {
      isNormalUser = true;
      description = "Ewan Bester";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };
}
