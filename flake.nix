{
  description = "I use nix Btw";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    # User Configuration
    userSettings = {
      username = "antisune";
      git = {
        username = "Antisune101";
        email = "ewanbester72@gmail.com"; # Should probably not put this in public file?
      };
      homeDir = "/home/${userSettings.username}";
      stylixYamlTheme = "classic-dark";
    };
    # Flake Configuration
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};
    systemModules = [
      ./configuration.nix
      ./harware-configuration.nix
      ./nixos/gaming.nix
      ./nixos/hyprland.nix

      inputs.home-manager.nixosModules.home-manager
    ];
    homeModules = [
      ./modules/programs/kitty.nix
      ./modules/programs/helix.nix
      ./modules/programs/btop.nix
      ./modules/programs/git.nix
    ];
    
  in
  {
    nixosConfigurations.nixos = lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        inherit userSettings;
        inherit systemModules;
      };
      modules = systemModules;
    };
  };
}
