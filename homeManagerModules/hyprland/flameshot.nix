{ config, lib, pkgs, userSettings, ... }:

{
    options = {
        hyprland.flameshot.enable = lib.mkEnableOption "Enable flameshot for taking screenshots";
    };

    config = lib.mkIf config.hyprland.flameshot.enable {
        home.packages = with pkgs; [
            grim
        ];

        services.flameshot = {
            enable = true;
            settings = {
                General = {
                    showStartupLaunchMessage = false;
                    useGrimAdapter = true;
                    savePath = "/home/${userSettings.username}/Pictures/Screenshots";
                    savePathFixed = true;
                    drawColor = config.stylix.namedColors.main;
                    uiColor = config.stylix.namedColors.main;
                    contrastUiColor = config.stylix.namedColors.background;
                };
            };
        };
    };
}
