{ config, lib, pkgs, ... }:

{
    options = {
        gowall.enable = lib.mkEnableOption "Enable gowall wallpaper theming tool";
    };

    config = lib.mkIf config.gowall.enable {
        xdg.configFile."gowall/config.yml" = {
            text = let colors = config.lib.stylix.colors; in ''
                themes:
                  - name: "stylix"
                    colors:
                      - "#${colors.base00}"
                      - "#${colors.base01}"
                      - "#${colors.base02}"
                      - "#${colors.base03}"
                      - "#${colors.base04}"
                      - "#${colors.base05}"
                      - "#${colors.base06}"
                      - "#${colors.base07}"
                      - "#${colors.base08}"
                      - "#${colors.base09}"
                      - "#${colors.base0A}"
                      - "#${colors.base0B}"
                      - "#${colors.base0C}"
                      - "#${colors.base0D}"
                      - "#${colors.base0E}"
                      - "#${colors.base0F}"
            '';
            onChange = ( if config.hyprland.customScripts.themewall.enable then "themewall" else "" );
        };
        home.packages = with pkgs; [ gowall ];
    };
}
