{ pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      
    };

    extraConfig = ''
      #Default apps:
      $terminal = kitty
      $menu = rofi -show drun
      $filemanager = kitty lf
      $screenshot = grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot saved" -t 1000
      $screenshotEdit = grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | swappy -f - | dunstify "Screenshot saved" -t 1000

      monitor=,preferred,auto,auto

      exec-once = waybar
      exec-once = swww init

      exec-once = /nix/store/rhhd98016vskn8fcqday697qvqbssv2s-polkit-gnome-0.105/libexec/polkit-gnome-authentication-agent-1
      exec-once = systemctl --user start graphical-session.target

      env = XCURSOR_SIZE,24

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

        follow_mouse = 1

          touchpad {
              natural_scroll = no
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          gaps_in = 5
          gaps_out = 10
          border_size = 2
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)

          layout = dwindle

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false
      }

      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = 0
    
          blur {
              enabled = true
              size = 3
              passes = 1
          }

          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }

      animations {
          enabled = yes

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }

      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
      }


      misc {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers

          enable_swallow = true
          swallow_regex = ^(kitty)$
      }


      windowrule = float, ^(thunar)$
      # Way too much effort into making lf look nice

      windowrulev2 = float,  class:^(kitty)$,title:^(lf)$
      windowrulev2 = size 50% 50%, class:^(kitty)$,title:^(lf)$
      windowrulev2 = center, class:^(kitty)$,title:^(lf)$

      windowrulev2 = stayfocused, title:^()$,class:^(steam)$
      windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod, Q, exec, $terminal
      bind = $mainMod, C, killactive, 
      bind = $mainMod, M, exit, 
      bind = $mainMod, E, exec, $filemanager
      bind = $mainMod, V, togglefloating, 
      bind = $mainMod, R, exec, $menu
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle

      # Fix Media Keys
      binde = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +2%
      binde = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -2%
      bind = , XF86AudioPlay, exec, playerctl play-pause
      bind = , XF86AudioNext, exec, playerctl next
      bind = , XF86AudioPrev, exec, playerctl previous

      # Screenshot
      bind = , Print, exec, $screenshot
      bind = $mainMod, Print, exec, $screenshotEdit

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Example special workspace (scratchpad)
      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}
