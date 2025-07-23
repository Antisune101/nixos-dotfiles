{ config, lib, pkgs, globalConfig, ... }:
let colors = config.stylix.namedColors; in
{
    options = {
        hyprland.waybar.enable = lib.mkEnableOption "Enable waybar status bar";
    };

    config = lib.mkIf config.hyprland.waybar.enable {
        stylix.targets.waybar = {
            addCss = false;
            enableLeftBackColors = false;
            enableRightBackColors = false;
            enableCenterBackColors = false;
        };
        home.packages = with pkgs; [ nerd-fonts.dejavu-sans-mono ];
        programs.waybar = {
            enable = true;
            settings = {
                mainBar = {
                    layer = "top";
                    position = "top";
                    height = 30;
                    spacing = 4;

                    modules-left = [
                        "hyprland/workspaces"
                        "hyprland/window"
                    ];

                    modules-center = [];

                    modules-right = [
                        "mpris"
                        "pulseaudio"
                        "battery"
                        "clock"
                        "tray"
                    ];

                    "hyprland/workspaces" = {
                        show-special = true;
                        persistent-workspaces."*" = 8;
                    };

                    "hyprland/window" = {
                        format = "{title}";
                        icon = true;
                        rewrite = {
                            "(.*) - Brave" = "Brave Browser";
                            "(.*) — Ablaze Floorp" = "Oddly named Firefox";
                            "(.*) — Mozilla Firefox" = "Firefox";
                            "(.*) — Librewolf" = "Librewolf";
                        };
                    };

                    mpris = {
                        format-playing = "[ {title} - {artist} ] [{status}]";
                        format-paused = "[ {title} - {artist} ] [{status} ]";
                        title-len = 30;
                        artist-len = 20;
                        player = "YoutubeMusic";
                        status-icons = {
                            "paused" = "▶";
                            "playing" = "⏸";
                        };
                    };

                    pulseaudio = {
                        scroll-step = 2;
                        max-volume = 100;
                        format = "[ Audio {volume}% ] [ {format_source} ]";
                        format-source = "Mic ON ";
                        format-source-muted = "Mic OFF";
                        on-click = "pavucontrol";
                    };

                    clock = {
                        format = "[ {:%H:%M} ]";
                        tooltip-format = "<tt><small>{calendar}</small></tt>";
                        calendar = {
                            mode = "year";
                            mode-mon-col = 3;
                            weeks-pos = "left";
                            format = {
                                months = "<span color ='${colors.main}'><b>{}</b></span>";
                                days = "<span color ='${colors.main}'><b>{}</b></span>";
                                weeks = "<span color ='${colors.blue}'><b>W{}</b></span>";
                                weekdays = "<span color ='${colors.yellow}'><b>{}</b></span>";
                                today = "<span color ='${colors.red}'><b><u>{}</u></b></span>";
                            };
                        };
                    };

                    tray.spacing = 4;
                };
            };
        };
    };
}
