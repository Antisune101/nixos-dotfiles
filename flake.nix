{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    textfox.url = "github:adriankarlen/textfox";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
    userSettings = {
      username = "ewanbester";
      homeDir = "/home/${userSettings.username}";

      # Shell settings
      shell = {
        sessionVariables = {
          EDITOR = "hx";
        };
        aliases = {
          # Nix
          rebuild = "sudo nixos-rebuild switch --flake ${userSettings.homeDir}/.config/dotfiles";
          # Git
          glo = "git log --oneline";
        };
      };

      # Git Settings
      git = {
        username = "Antisune101";
        email = "ewanbester72@gmail.com";
      };

      # Appearance settings
      cursorSize = 24;
      font = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
    
  in {
    nixosConfigurations.nixos = lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; inherit userSettings; inherit lib; };
      modules = [
        ./configuration.nix
        ./modules/adb.nix
        ./modules/amd-graphics.nix
        ./modules/audio.nix
        ./modules/btop.nix
        ./modules/desktop-apps.nix
        ./modules/git.nix
        ./modules/helix.nix
        ./modules/kitty.nix
        ./modules/ly.nix
        ./modules/printing.nix
        ./modules/steam.nix
        ./modules/stylix.nix
        ./modules/system-utils.nix
        ./modules/textfox.nix
        ./modules/usb.nix
        ./modules/yazi.nix
        ./modules/zsh.nix
        ./modules/hyprland/hyprland.nix
        ./modules/hyprland/keybinds.nix
        ./modules/hyprland/windowrules.nix
        ./modules/hyprland/waybar.nix
        ./modules/hyprland/rofi.nix
        ./modules/programming/go.nix
        ./modules/programming/rust.nix
        ./modules/programming/webdev.nix

        inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            extraSpecialArgs = { inherit inputs; inherit userSettings; };
            backupFileExtension = "bakcup";
            # useGlobalPkgs = true;
            useUserPackages = true;
            users.${userSettings.username} = import ./home.nix;
          };
        }
      ];
    };
  };
}
