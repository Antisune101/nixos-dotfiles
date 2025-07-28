{ config, lib, ... }:

{
    options = {
        hyprland.hypridle.enable = lib.mkEnableOption "Enable hypridle idle management daemon";
    };

    config.services.hypridle = lib.mkIf config.hyprland.hyprpolkit.enable {
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
