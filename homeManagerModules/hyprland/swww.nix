{ config, lib, pkgs, ... }:

{
    options = {
        hyprland.swww.enable = lib.mkEnableOption "Enables swww for wallpapers";
    };

    config = lib.mkIf config.hyprland.swww.enable {
        home.packages = with pkgs; [ swww ];
    };
}
