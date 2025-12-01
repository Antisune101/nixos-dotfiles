{ config, lib, pkgs, ... }:

{
    options = {
        gowall.enable = lib.mkEnableOption "Enable gowall wallpaper theming tool";
    };

    config = lib.mkIf config.gowall.enable {
        xdg.configFile."gowall/config.yml" = {
            text = ''
                themes:
                  - name: "stylix"
                    colors:
                      - "#191724"
                      - "#1f1d2e"
                      - "#26233a"
                      - "#6e6a86"
                      - "#908caa"
                      - "#e0def4"
                      - "#e0def4"
                      - "#524f67"
                      - "#eb6f92"
                      - "#f6c177"
                      - "#ebbcba"
                      - "#31748f"
                      - "#9ccfd8"
                      - "#c4a7e7"
                      - "#f6c177"
            '';
            onChange = ( if config.hyprland.customScripts.themewall.enable then "themewall" else "" );
        };
        home.packages = with pkgs; [ gowall ];
    };
}
