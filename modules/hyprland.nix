{ pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
        exec-once = [
            "waybar"
            "swww init"
            "systemctl --user start graphical-session.target"
            "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
            "xhost +"
            "nm-applet --indicator"
            "blueman-applet"
            "rclone --vfs-cache-mode writes mount OneDrive: ~/Documents/OneDrive &"

        ];

        general = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more

            gaps_in = 5;
            gaps_out = 10;
            border_size = 1;
            # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            # "col.inactive_border" = "rgba(595959aa)";
            resize_on_border = true;

            layout = "master";

            # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
            allow_tearing = false;
        };

        decoration = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more

            rounding = 0;

            blur = {
              enabled = true;
              size = 3;
              passes = 1;
            };

            drop_shadow = "yes";
            shadow_range = 4;
            shadow_render_power = 3;
            # "col.shadow" = "rgba(1a1a1aee)";
        };

        
        #Default apps:
        "$terminal" = "kitty";
        "$menu" = "rofi -show drun";
        "$filemanager" = "kitty lf";
        "$screenshot" = ''grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | notify-send "Screenshot saved" -t 1000'';
        "$screenshotEdit" = ''grim -g "$(slurp)" - | swappy -f - -o - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | notify-send "Screenshot being edited" -t 1000'';

        monitor = ",preferred,auto,auto";

        env = "XCURSOR_SIZE,24";

        # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
        input = {
            kb_layout = "us";
            kb_variant = "";
            kb_model = "";
            kb_options = "";
            kb_rules = "";

            follow_mouse = 1;
            # float_switch_override_focus = true;
            # mouse_refocus = false;

            numlock_by_default = true;

            touchpad = {
                natural_scroll = "no";
            };

            sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        };

        animations = {
            enabled = "yes";

            # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

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

        dwindle = {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = "yes"; # you probably want this
        };

        master = {
            # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
            # new_is_master = "true";
        };
    

        misc = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            force_default_wallpaper = 0; # Set to 0 to disable the anime mascot wallpapers
            disable_hyprland_logo = true;
            disable_splash_rendering = true;

            enable_swallow = "true";
            swallow_regex = "^(kitty)$";
        };

        windowrule = [
            "float, ^(thunar)$"
            "float, ^(org.gnome.Calculator)$"
            "float, ^(org.gnome.Nautilus)$"
            "float, ^(pavucontrol)"
            "size 50% 50%, ^(org.gnome.Nautilus)$"
            "center, ^(org.gnome.Nautilus)$"
            "float, ^(.blueman-manager-wrapped)$"
            # Way too much effort into making lf look nice Edit: It all went to waste (at least for now)

            # float,  class:^(kitty)$,title:^(lf)$
            # size 50% 50%, class:^(kitty)$,title:^(lf)$
            # center, class:^(kitty)$,title:^(lf)$

        ];

        windowrulev2 = [            
            "stayfocused, title:^()$,class:^(steam)$"
            "minsize 1 1, title:^()$,class:^(steam)$"
            # "float, title:^(Steam Settings)$,class:^(steam)$"
        ];

        # See https://wiki.hyprland.org/Configuring/Keywords/ for more
        "$mainMod" = "SUPER";

        bind = [
            "$mainMod, Q, exec, $terminal"
            "$mainMod SHIFT, Q, exec, float; $terminal"
            "$mainMod, C, killactive, "
            "$mainMod, M, exit, "
            "$mainMod, E, exec, $filemanager"
            "$mainMod, V, togglefloating, "
            "$mainMod, R, exec, $menu"
            "$mainMod, F, fullscreen,"
            "$mainMod, G, layoutmsg, swapwithmaster"
            "$mainMod, P, pseudo, # dwindle"
            "$mainMod, J, togglesplit, # dwindle"

            # Screenshot
            ", Print, exec, $screenshot"
            "$mainMod, Print, exec, $screenshotEdit"

            # Move focus with mainMod + arrow keys
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"

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

            # Example special workspace (scratchpad)
            "$mainMod, S, togglespecialworkspace, magic"
            "$mainMod SHIFT, S, movetoworkspace, special:magic"

            # Scroll through existing workspaces with mainMod + scroll
            "$mainMod, mouse_down, workspace, e+1"
            "$mainMod, mouse_up, workspace, e-1"

            # Media keys for play-pause and next-prev
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPrev, exec, playerctl previous"
        ];

        binde = [
            # Volume keys
            ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +2%"
            ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -2%"
        ];

        bindm = [
            # Move/resize windows with mainMod + LMB/RMB and dragging
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
        ];
    };
    };
}
