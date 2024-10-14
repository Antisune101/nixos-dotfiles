{ pkgs, lib, userSettings, ... }: {
    home = {
        username = "${userSettings.username}";
        homeDirectory = "${userSettings.homeDir}";
        stateVersion = "24.05";
    };
    imports = [
        ./home-manager/hyprland.nix
        ./home-manager/waybar.nix
        ./home-manager/kitty.nix
        ./home-manager/helix.nix
        ./home-manager/btop.nix
        ./home-manager/git.nix
    ];


    programs = {
        rofi = {
            enable = true;
            package = pkgs.rofi-wayland;
            font = lib.mkDefault "JetBrainsMono Nerd Font Mono 24";
            extraConfig = {
                show-icons = true;
                display-drun = "What we runnin?";
                drun-display-format = "{name}";
            };
        };
        home-manager.enable = true;
    };    

    services.hyprpaper.enable = lib.mkForce false;

    gtk.iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
    };
}
