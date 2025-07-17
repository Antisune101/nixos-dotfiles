{ config, lib, ... }:

{
    options = {
        hyprland.swayosd.enable = lib.mkEnableOption "Enables SwayOSD for shortcut notifications";
    };

    config.services.swayosd = lib.mkIf config.hyprland.swayosd.enable {
        enable = true;
    };
}
