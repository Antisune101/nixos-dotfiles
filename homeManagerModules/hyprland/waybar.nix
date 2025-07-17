{ config, lib, pkgs, ... }:

{
    options = {
        hyprland.waybar.enable = lib.mkEnableOption "Enable waybar status bar";
    };

    config = lib.mkIf config.hyprland.waybar.enable {
        home.packages = with pkgs; [ nerd-fonts.dejavu-sans-mono ];
        programs.waybar = {
            enable = true;
            systemd.enable = true;
        };
    };
}
