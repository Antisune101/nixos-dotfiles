{ pkgs, userSettings, ... }:

{
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
          "hyprland/window"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "mpris"
          "pulseaudio"
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

        tray = {
          spacing = 4;
        };
      };
    };
  };
}
