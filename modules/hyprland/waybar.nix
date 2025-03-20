{ config, pkgs, userSettings, ... }:
let 
  stylixColors = config.lib.stylix.colors;
  colors = {
    main = "#${stylixColors.base00}";
    red = "#${stylixColors.base01}";
    orange = "#${stylixColors.base05}";
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
        height = 36;
        spacing = 4;

        modules-left = [
          "hyprland/workspaces"
          # "hyprland/window"
        ];

        modules-center = [
        ];

        modules-right = [
          "mpris"
          "pulseaudio"
          "clock"
          "tray"
        ];

        "hyprland/window" = {
          format = "{title}";
          icon = true;
          rewrite = {
            "(.*) - Brave" = "Brave Browser";
            "(.*) — Ablaze Floorp" = "Oddly named Firefox";
            "(.*) — Mozilla Firefox" = "Firefox";
          };
        };

        mpris ={
          format = "[ {title} - {artist} ] -> {status}";
          title-len = 30;
          artist-len = 20;
          player = "YoutubeMusic";
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

      #clock {
        color: ${colors.yellow};
      }

      #pulseaudio {
        color: ${colors.red};
      }

      #mpris {
        color: ${colors.blue};
      }
    '';
  };
}
