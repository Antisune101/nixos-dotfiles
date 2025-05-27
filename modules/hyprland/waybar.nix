{ config, pkgs, userSettings, ... }:
let 
  stylixColors = config.lib.stylix.colors;
  colors = {
    background = "#${stylixColors.base00}";
    alt_background = "#${stylixColors.base01}";
    main = "#${stylixColors.base05}";
    alt_main = "#${stylixColors.base04}";
    red = "#${stylixColors.base08}";
    orange = "#${stylixColors.base09}";
    yellow = "#${stylixColors.base0A}";
    green = "#${stylixColors.base0B}";
    cyan = "#${stylixColors.base0C}";
    blue = "#${stylixColors.base0D}";
    purple = "#${stylixColors.base0E}";
    brown = "#${stylixColors.base0F}";
  };
in {
  home-manager.users.${userSettings.username}.programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 42;
        spacing = 6;

        modules-left = [
          "hyprland/workspaces"
          # "hyprland/window"
        ];

        modules-center = [
        ];

        modules-right = [
          "mpris"
          # "cava"
          "pulseaudio"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          show-special = true;
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "hyprland/window" = {
          format = "{title}";
          icon = true;
          rewrite = {
            "(.*) - Brave" = "Brave Browser";
            "(.*) — Ablaze Floorp" = "Oddly named Firefox";
            "(.*) — Mozilla Firefox" = "Firefox";
          };
        };

        cava = {
          framerate = 120;
          autosens = 1;
          bars = 12;
          method = "pipewire";
          source = "pipewire-0:Chromium";
          bar_delimiter = 0;
          input_delay = 2;
          sleep_timer = 2;
          hide_on_silence = false;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };

        mpris = {
          format-playing = "[ {title} - {artist} ][{status}]";
          format-paused = "[ {title} - {artist} ][{status} ]";
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
          format = "[ Audio {volume}% ][ {format_source} ]";
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

        tray = {
          spacing = 4;
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: ${userSettings.font.name};
      }


      window#waybar {
        background-color: transparent;
        padding: 5px 10px;
      }

      #clock, #pulseaudio, #mpris, #tray {
        padding: 5px;
        margin: 5px;
      }

      #workspaces {
        color: ${colors.main};
        background-color: ${colors.alt_background};
        box-shadow: -5px 5px ${colors.background};
        margin: 5px;
        margin-left: 10px;
        border: none;
      }

      #workspaces button {
        padding: 5px;
        border: none;
      }

      #workspaces button.empty {
        color: ${colors.alt_main};
      }

      #workspaces button.active, #workspaces button.focused {
        color: ${colors.background};
        background-color: ${colors.yellow};
      }



      #mpris {
        color: ${colors.background};
        background-color: ${colors.cyan};
        box-shadow: 5px 5px ${colors.blue};
      }

      #pulseaudio {
        color: ${colors.background};
        background-color: ${colors.red};
        box-shadow: 5px 5px ${colors.brown};
        
      }

      #clock {
        color: ${colors.background};
        background-color: ${colors.yellow};
        box-shadow: 5px 5px ${colors.orange};
        
      }

      #tray {
        color: ${colors.main};
        background-color: ${colors.alt_background};
        box-shadow: 5px 5px ${colors.background};
        margin-right: 10px;
      }

    '';
  };
}
