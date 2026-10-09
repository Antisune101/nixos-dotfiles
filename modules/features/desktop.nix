{ self, ... }: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    imports = [
      self.nixosModules.cosmic
      self.nixosModules.kanata
      self.nixosModules.firefox
      self.nixosModules.kitty
      self.nixosModules.printing
    ];

    environment.systemPackages = with pkgs; [
      pear-desktop
      grayjay
      obsidian
      
    ];
  };
}
