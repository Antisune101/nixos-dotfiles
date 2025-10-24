{ config, lib, ... }: let
    colors = config.stylix.namedColors;
in {
    options = {
        hyprland.rofi.enable = lib.mkEnableOption "Enable rofi app launcher";
    };

    config = lib.mkIf config.hyprland.rofi.enable {
        programs.rofi = {
            enable = true;
            extraConfig = {
                display-drun = "Launch";
                show-icons = true;
            };
            font = lib.mkForce "IosevkaTerm Nerd Font 18";
            theme =  let inherit(config.lib.formats.rasi) mkLiteral; in lib.mkForce {
                "*" = {
                    border = 0;
                    margin = 0;
                    padding = 0;
                    spacing = 0;
                    width = 512;
                    background-color = mkLiteral colors.background;
                };
                
                mainbox = {
                    children = mkLiteral "[inputbar, listview]";
                    border = 2;
                    border-color = mkLiteral colors.alt_background;
                };

                inputbar = {
                    children = mkLiteral "[prompt, entry]";
                };

                entry = {
                    padding = mkLiteral "12px 0";
                    text-color = mkLiteral colors.alt_main;
                };

                prompt = {
                    padding = mkLiteral "12px";
                    text-color = mkLiteral colors.alt_main;
                };

                listview = {
                    lines = 8;
                };

                element = {
                    children = mkLiteral "[element-icon, element-text]";
                };

                element-icon = {
                    padding =  mkLiteral "12px";
                    size = mkLiteral "32px";
                };

                element-text = {
                    padding = mkLiteral "12px";
                    text-color = mkLiteral colors.main;
                };

                "element-text selected" = {
                    text-color = mkLiteral colors.alt_main;
                };
            };

        };
    };
}
