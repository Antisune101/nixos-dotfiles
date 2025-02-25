{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    textfox.url = "github:adriankarlen/textfox";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    userSettings = {
      username = "antisune";
      homeDir = "/home/${userSettings.username}";
      terminal = "kitty";
      hyprland = {
        menu = "bemenu-run";
        bar_height = 24;
      };
      git = {
        username = "Antisune101";
        email = "ewanbester72@gmail.com";
      };
    };
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations.nixos = lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; inherit userSettings; };
      modules = [
        ./configuration.nix
      	./hardware-configuration.nix
      	./modules/audio.nix
      	./modules/amd-graphics.nix
      	./modules/printing.nix
        ./modules/usb.nix
      	./modules/steam.nix
      	./modules/desktop-apps.nix
        ./modules/git.nix
        ./modules/zsh.nix
        ./modules/firefox.nix
      	./modules/hyprland/hyprland.nix
      	./modules/hyprland/keybinds.nix
        ./modules/hyprland/waybar.nix
        ./modules/hyprland/bemenu.nix

	inputs.home-manager.nixosModules.home-manager
      ];
    };
  };
}
