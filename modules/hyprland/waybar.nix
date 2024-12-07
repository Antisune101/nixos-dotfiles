{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [
    waybar
  ];

  services.playerctld.enable = true;

  home-manager.users.${userSettings.username} = {
    wayland.windowManager.hyprland.settings.exec-once = [
      "waybar"
    ];

    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 24;
          spacing = 4;
          margin = "0";

          modules-left = [
            "hyprland/workspaces"
            "hyprland/window"
          ];

          modules-center = [
            # "hyprland/window"
            "clock"
          ];

          modules-right = [
            "mpris"
            "pulseaudio"
            "tray"
            "custom/notification"
          ];

          "hyprland/window" = {
            format = "{title}";
            icon = true;
            rewrite = {
              "(.*) - Brave" = "Brave";
            };
          };

          "custom/notification" = {
            tooltip = false;
            format = "{icon}";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
              dnd-notification = "<span foreground='red'><sup></sup></span>";
              dnd-none = "";
              inhibited-notification = "<span foreground='red'><sup></sup></span>";
              inhibited-none = "";
              dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "swaync-client -t";
            on-click-right = "swaync-client -d -sw";
            escape = true;
          };

          tray = {
            icon-size = 15;
            spacing = 10;
          };

          mpris = {
            format = "[ {title} | {artist} ] -> ({status}) ";
            title-len = 30;
            artist-len = 20;
            player = "YoutubeMusic";
          };

          pulseaudio = {
            # // "scroll-step": 1, // %, can be a float
            format = " {volume}% ";
            format-source = "Mic {volume}%";
              on-click = "pavucontrol";
          };
        };
      };
      style = ''
        * {
          border-radius: 0;
          font-family: JetBrainsMono Nerd Font Mono;
          font-size: 16px;
        }
        
        window#waybar {
          background: rgba(0.0, 0.0, 0.0, 0.5);  
        }

        #custom-notification {
          font-size: 24px;
          margin: 0px 8px 0px 8px;
        }
        '';
    }; 
  };
}
