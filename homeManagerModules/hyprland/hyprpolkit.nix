{ config, lib, ... }:
{
    options = {
        hyprland.hyprpolkit.enable = lib.mkEnableOption "Enable hyprpolkit agent";
    };

    config = lib.mkIf config.hyprland.hyprpolkit.enable {
        services.hyprpolkitagent.enable = true;
    };
}
