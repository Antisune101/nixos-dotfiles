{ pkgs, lib, userSettings, inputs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  home-manager.users.${userSettings.username}.wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "kitty";
      "$tuiFileManager" = "$terminal yazi";
      "$guiFileManager" = "nautilus";
      "$menu" = "rofi -show drun";
      "$changeWallpaper" = "kitty yazi ~/Pictures/Wallpapers";
      "$screenshotWindow" = "hyprshot -m window -o ~/Pictures/Screenshots";
      "$screenshotArea" = "hyprshot -m region -o ~/Pictures/Screenshots";
      
      monitor = "DP-1, 1920x1080@180, 0x0, 1";

      exec-once = [
        "swww-daemon"
        "waybar"
        "nm-applet"
        "systemctl --user start hyprpolkitagent"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        resize_on_border = true;
        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      animations = {
          enabled = true;
          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];
          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];
      };
      
      master = {
        new_status = "master";
        mfact = 0.55;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        enable_swallow = true;
        swallow_regex = "^(kitty)$";
      };

      input = {
        kb_layout = "us";
        kb_options = "compose:alt";
        follow_mouse = 1;
        sensitivity = 0;
        numlock_by_default = true;
      };
    };
  };
}
