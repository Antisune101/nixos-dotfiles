{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [
    waybar
  ];

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
            "clock"
          ];

          modules-right = [
            "tray"
            "pulseaudio"
          ];
          "hyprland/window" = {
            format = "{title}";
            icon = true;
          };

          tray = {
            icon-size = 15;
            spacing = 10;
          };

          pulseaudio = {
            # // "scroll-step": 1, // %, can be a float
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
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
        };
      };
      style = ''
        * {
          border-radius: 0;
          font-family: JetBrainsMono Nerd Font Mono;
        }
        '';
    }; 
  };
}
