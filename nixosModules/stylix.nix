{ config, lib, inputs, pkgs, userSettings, ... }:

{
    imports = [
        inputs.stylix.nixosModules.stylix
    ];

    options = {
        stylix.namedColors = lib.mkOption {
            default = {};
            description = "A set containing the values from config.lib.stylix.colors with sensible names as Hex strings";
        };
    };


    config.stylix = lib.mkIf config.stylix.enable {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

        fonts = {
            serif = {
                package = userSettings.font.package;
                name = userSettings.font.name;
            };
            sansSerif = {
                package = userSettings.font.package;
                name = userSettings.font.name;
            };
            monospace = {
                package = userSettings.font.package;
                name = userSettings.font.name;
            };
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
          size = 24;
        };

        namedColors = let colors = config.lib.stylix.colors; in {
            background = "#${colors.base00}";
            alt_background = "#${colors.base01}";
            main = "#${colors.base05}";
            alt_main = "#${colors.base04}";
            red = "#${colors.base08}";
            orange = "#${colors.base09}";
            yellow = "#${colors.base0A}";
            green = "#${colors.base0B}";
            cyan = "#${colors.base0C}";
            blue = "#${colors.base0D}";
            purple = "#${colors.base0E}";
            brown = "#${colors.base0F}";
        };
    };

}
