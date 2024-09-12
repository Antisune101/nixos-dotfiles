{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "antisune";
  home.homeDirectory = "/home/antisune";

  home.stateVersion = "24.05";

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs = {
    kitty = {
      enable = true;
      extraConfig = ''
        confirm_os_window_close 0
        background_opacity 0.6
      '';
    };

    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      enableCompletion = true;
      syntaxHighlighting.enable = true;
    };

    git = {
      enable = true;
      userName = "Antisune101";
      userEmail = "ewanbester72@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    helix.enable = true;
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      terminal = "${pkgs.kitty}/bin/kitty";
      extraConfig = {
        show-icons = true;
        display-drun = "Applications";
        drunc-display-format = "{name}";
      };
    };

    btop = {
      enable = true;
      settings = {
        theme_background = false;
        vim_keys = true;
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "swww-daemon"
      ];

      env = "XCURSOR_SIZE,24";

      monitor = ",preferred,auto,auto";

      "$terminal" = "kitty";
      "$menu" = "rofi -show drun";
      "$filemanager" = "kitty yazi";
      "$mainMod" = "SUPER";

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
        resize_on_border = true;
        layout = "master";
        allow_tearing = false;
      };

      decoration = {
        rounding = 8;
        
        inactive_opacity = 0.8;
        active_opacity = 0.95;
        fullscreen_opacity = 1.0;
        
        blur = {
          enabled = true;
          size = 10;
          passes = 3;
          new_optimizations = true;
          # ignore_opacity = true;
          noise = 0;
          brightness = 0.9;
        };

        drop_shadow = false;
        shadow_range = 4;
        shadow_render_power = 3;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        numlock_by_default = true;

      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = "true";
        swallow_regex = "^(kitty)$";
      };

      bind = [
        "$mainMod, C, killactive, "
        "$mainMod, M, exit, "
        "$mainMod, V, togglefloating,"
        "$mainMod, F, fullscreen,"
        
        "$mainMod, Q, exec, $terminal"
        "$mainMod, R, exec, $menu"
        "$mainMod, E, exec, $filemanager"

        "$mainMod, S, togglespecialworkspace, scratch"
        "$mainMod SHIFT, S, movetoworkspace, special:scratch"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Vim keys for focus nav :)
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        
        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        
        # Get the damn media keys to work
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      binde = [
        # Raise/Lower volume
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +2%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -2%"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
    
  };

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };

  qt.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
