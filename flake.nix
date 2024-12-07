{
  description = "I use nix Btw";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
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
      stylixYamlTheme = "gruvbox-dark-medium"; # See https://github.com/tinted-theming/schemes?tab=readme-ov-file for list of themes
    };
    # Flake Configuration
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};
    systemModules = [
      ./configuration.nix
      ./hardware-configuration.nix
      ./modules/gaming.nix
      ./modules/hyprland/hyprland.nix

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
        inherit homeModules;
      };
      modules = systemModules;
    };
  };
}
