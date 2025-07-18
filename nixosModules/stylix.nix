{ config, lib, inputs, pkgs, ... }:

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


    config = lib.mkIf config.stylix.enable {
        stylix = {
            base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

            cursor = {
              package = pkgs.bibata-cursors;
              name = "Bibata-Modern-Ice";
              size = 24;
            };
        };
        stylix.namedColors = let colors = config.lib.stylix.colors; in {
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
