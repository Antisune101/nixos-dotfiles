{ config, lib, ... }:

{
    options = {
        hyprland.hyprlock.enable = lib.mkEnableOption "Enable hyprlock lock screen";
    };

    config.programs.hyprlock = lib.mkIf config.hyprland.hyprpolkit.enable {
        enable = true;
        settings = {
            general = {
                hide_cursor = true;
                ignore_empty_input = true;
            };
            background = {
                path = "screenshot";
                blur_passes = 3;
                blur_size = 8;
            };
        };
    };
}
