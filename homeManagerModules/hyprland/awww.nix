{ config, lib, pkgs, ... }:

{
    options = {
        hyprland.awww.enable = lib.mkEnableOption "Enables awww for wallpapers";
    };

    config = lib.mkIf config.hyprland.awww.enable {
        home.packages = with pkgs; [ awww ];
    };
}
