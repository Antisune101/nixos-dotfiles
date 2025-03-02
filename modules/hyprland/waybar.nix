{pkgs, userSettings, ... }:

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
          height = userSettings.hyprland.bar_height;
          spacing = 4;
          margin = "0";

          modules-left = [
            "hyprland/workspaces"
            "hyprland/window"
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
              "(.*) — Mozilla Firefox" = "Firefox";

            };
          };

          mpris = {
            format = "[ {title} | {artist} ] -> ({status})";
            title-len = 30;
            artist-len = 20;
            player = "YoutubeMusic";
          };

          pulseaudio = {
            scroll-step = 2;
            max-volume = 100;
            format = "Audio {volume}%";
            format-source = "Mic {volume}%";
            on-click = "pavucontrol";
          };
        };
      };
    };
  };
}
