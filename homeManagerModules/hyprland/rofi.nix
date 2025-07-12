{ config, lib, ... }:

{
    options = {
        hyprland.rofi.enable = lib.mkEnableOption "Enable rofi app launcher";
    };

    config = lib.mkIf config.hyprland.rofi.enable {
        programs.rofi = {
            enable = true;

        };
    };
}
