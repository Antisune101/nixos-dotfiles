{ pkgs, lib, userSettings, ... }: {
    home = {
        username = "${userSettings.username}";
        homeDirectory = "${userSettings.homeDir}";
        stateVersion = "24.05";
    };
    imports = [
        ./home-manager/stylix.nix
        ./home-manager/hyprland.nix
        ./home-manager/waybar.nix
        ./home-manager/kitty.nix
        ./home-manager/helix.nix
        ./home-manager/btop.nix
        ./home-manager/git.nix
        ./home-manager/rofi.nix
    ];


    programs = {
        home-manager.enable = true;
    };    

    services.hyprpaper.enable = lib.mkForce false;

    gtk.iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
    };
}
