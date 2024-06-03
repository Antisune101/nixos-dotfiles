{ config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings =  {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        # modules-center = [ ];
        modules-right = [ "pulseaudio" "tray" "clock" ];

        pulseaudio = {
          # // "scroll-step": 1, // %, can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        clock = {
            format = "󰥔 {:%H:%M}";
        };

        tray.spacing = 10;
      };
    };
    style = ''
      * {
            font-family: JetBrainsMono Nerd Font, FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            font-size: 14px;
            font-weight: bold;
        }

        window#waybar {
            background-color: #1f2223;
            border-bottom: 8px solid #191c1d;
            color: #ebdbb2;
            transition-property: background-color;
            transition-duration: .5s;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        /*
        window#waybar.empty {
            background-color: transparent;
        }
        window#waybar.solo {
            background-color: #FFFFFF;
        }
        */

        button {
            all: unset;
            background-color: #689d6a;
            color: #282828;
            border: none;
            border-bottom: 8px solid #518554;
            border-radius: 5px;
            margin-left: 4px;
            margin-bottom: 2px;
            font-family: JetBrainsMono Nerd Font, sans-sherif;
            font-weight: bold;
            font-size: 14px;
            padding-left: 15px;
            padding-right: 15px;
            transition: transform 0.1s ease-in-out;
        }

        button:hover {
            background: inherit;
            background-color: #8ec07c;
            border-bottom: 8px solid #76a765;
        }

        button.active {
            background: inherit;
            background-color: #7db37e;
            border-bottom: 8px solid #659a68;
        }

        #mode {
            background-color: #64727D;
            border-bottom: 3px solid #ffffff;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #wireplumber,
        #custom-media,
        #tray,
        #mode,
        #idle_inhibitor,
        #scratchpad,
        #custom-swaync,
        #custom-menu,
        #mpd {
            padding: 0 10px;
            color: #ffffff;
        }

        #window,
        #workspaces {
            margin: 0 4px;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }

        #window {
            background-color: #303030;
            color: #ebdbb2;
            font-family: JetBrainsMono Nerd Font, monospace;
            font-size: 15px;
            font-weight: bold;
            border: none;
            border-bottom: 8px solid #272727;
            border-radius: 5px;
            margin-bottom: 2px;
            padding-left: 10px;
            padding-right: 10px;
        }

        #custom-swaync {
            background-color: #689d6a;
            color: #282828;
            font-family: JetBrainsMono Nerd Font, monospace;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-bottom: 8px solid #518554;
            border-radius: 5px;
            margin-bottom: 2px;
            padding-left: 13px;
            padding-right: 9px;
        }

        #custom-menu {
            background-color: #689d6a;
            color: #282828;
            font-family: JetBrainsMono Nerd Font, monospace;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-bottom: 8px solid #518554;
            border-radius: 5px;
            margin-bottom: 2px;
            padding-left: 14px;
            padding-right: 8px;
        }

        #custom-powermenu {
            background-color: @--powermenu-button--;
            color: @--powermenu-button-foreground--;
            font-family: JetBrainsMono Nerd Font, monospace;
            font-size: 22px;
            font-weight: bold;
            border: none;
            border-bottom: 8px solid @--powermenu-button-bottom--;
            border-radius: 5px;
            margin-bottom: 2px;
            margin-right: 4px;
            padding-left: 14px;
            padding-right: 7px;
        }

        #clock {
            background-color: #98971a;
            color: #282828;
            font-family: JetBrainsMono Nerd Font, monospace;
            font-size: 15px;
            font-weight: bold;
            border: none;
            border-bottom: 8px solid #828200;
            border-radius: 5px;
            margin-bottom: 2px;
        }


        @keyframes blink {
            to {
                background-color: #ffffff;
                color: #000000;
            }
        }


        label:focus {
            background-color: #000000;
        }

        #network {
            background-color: #2980b9;
        }

        #network.disconnected {
            background-color: #f53c3c;
        }

        #pulseaudio {
            background-color: #f2b13c;
            color: #282828;
            font-family: JetBrainsMono Nerd Font, monospace;
            font-size: 15px;
            font-weight: bold;
            border: none;
            border-bottom: 8px solid #d79921;
            border-radius: 5px;
            margin-bottom: 2px;
        }

        /*
        #pulseaudio.muted {
            background-color: #90b1b1;
            color: #2a5c45;
        }
        */

        #wireplumber {
            background-color: #fff0f5;
            color: #000000;
        }

        #wireplumber.muted {
            background-color: #f53c3c;
        }


        #tray {
            background-color: #ec7024;
            color: #282828;
            font-family: JetBrainsMono Nerd Font, monospace;
            font-size: 15px;
            font-weight: bold;
            border: none;
            border-bottom: 8px solid #d05806;
            border-radius: 5px;
            margin-bottom: 2px;
        }

        #tray > .passive {
            -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background-color: #eb4d4b;
        }


        tooltip {
          background-color: #1f2223;
          border: none;
          border-bottom: 8px solid #191c1d;
          border-radius: 5px;
        }

        tooltip decoration {
          box-shadow: none;
        }

        tooltip decoration:backdrop {
          box-shadow: none;
        }

        tooltip label {
          color: #ebdbb2;
          font-family: JetBrainsMono Nerd Font, monospace;
          font-size: 16px;
          padding-left: 5px;
          padding-right: 5px;
          padding-top: 0px;
          padding-bottom: 5px;
        }
    '';
  };

}
