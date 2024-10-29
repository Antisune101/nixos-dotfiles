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
          height = 28;
          spacing = 4;
          margin = "0";

          modules-left = [
            "hyprland/workspaces"
            "hyprland/window"
          ];

          modules-center = [
            # "hyprland/window"
          ];

          modules-right = [
            "mpris"
            "pulseaudio"
            "tray"
            "clock"
          ];

          "hyprland/window" = {
            format = "{title}";
            icon = true;
            rewrite = {
              "(.*) - Brave" = "Brave";
            };
          };

          tray = {
            icon-size = 15;
            spacing = 10;
          };

          mpris = {
            format = "[ {title} | {artist} ] -> ({status}) ";
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
        '';
    }; 
  };
}
