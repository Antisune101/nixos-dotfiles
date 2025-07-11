{ config, lib, pkgs, ... }:

{
    options = {
        hyprland.dunst.enable = lib.mkEnableOption "Enable dunst notification manager";
    };

    config = lib.mkIf config.hyprland.dunst.enable {
        home.packages = with pkgs; [
            libnotify
        ];

        services.dunst = {
            enable = true;
        };
    };
}
