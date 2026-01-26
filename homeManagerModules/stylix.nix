{ config, globalConfig, lib, pkgs, ... }:
{
    options = {
        stylix.namedColors = lib.mkOption {
            default = {};
            description = "A set containing the values from config.lib.stylix.colors with sensible names as Hex strings";
        };
    };

    config.stylix = lib.mkIf config.stylix.enable {
        namedColors = globalConfig.stylix.namedColors;
        icons = {
            enable = true;
            package = pkgs.papirus-icon-theme;
            light = "Papirus-Light";
            dark = "Papirus-Dark";
        };
        
    };
}
