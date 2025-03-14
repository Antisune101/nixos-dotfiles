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
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;

    
    userSettings = {
      username = "antisune";
      homeDir = "/home/${userSettings.username}";
      shell = {
        aliases = {};
        sessionVariables = {
          EDITOR = "hx";
        };
      };
      base16Theme = "${pkgs.base16-schemes}/share/themes/classic-dark.yaml";
      font = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
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
  in
  {
    nixosConfigurations.nixos = lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; inherit lib; inherit userSettings; };
      modules = [
        ./configuration.nix
      	./hardware-configuration.nix
      	./modules/audio.nix
      	./modules/amd-graphics.nix
      	./modules/printing.nix
        ./modules/stylix.nix
        ./modules/usb.nix
      	./modules/steam.nix
      	./modules/desktop-apps.nix
        ./modules/git.nix
        ./modules/zsh.nix
        ./modules/helix.nix
        ./modules/yazi.nix
        ./modules/firefox.nix
      	./modules/hyprland/hyprland.nix
        ./modules/hyprland/ly.nix
      	./modules/hyprland/keybinds.nix
        ./modules/hyprland/waybar.nix
        ./modules/hyprland/bemenu.nix

	inputs.home-manager.nixosModules.home-manager
      ];
    };
  };
}
