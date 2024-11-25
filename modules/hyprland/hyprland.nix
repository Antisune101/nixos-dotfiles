{ pkgs, userSettings, ... }:
let
    use_animation = "0";
in
{
    imports = [
        ../system/printer.nix
        ../system/audio.nix
        ../system/graphics.nix
        ./stylix.nix
        ./polkit.nix
        ./waybar.nix
        ./swaync.nix
        ./rofi.nix
        ./usb.nix
        ./swww.nix
    ];

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
        xdg-desktop-portal-hyprland
    ];

    home-manager.users.${userSettings.username} = {
        home.packages = with pkgs; [
            hyprshot
            swayimg
        ];

        wayland.windowManager.hyprland = {
            enable = true;
            settings = {
                # Startup Apps
                exec-once = [
                    "swww-daemon"
                ];

                monitor = ",preferred,auto,auto";

                # Programs
                "$terminal" = "kitty";
                "$fileManager" = "nautilus";
                "$windowSwitcher" = "rofi -show window";
                "$menu" = "rofi -show drun";

                env = [
                    "XCURSOR_SIZE,24"
                    "HYPRCURSOR_SIZE,24"
                ];

                general = {
                    gaps_in = 4;
                    gaps_out = 8;

                    border_size = 2;

                    # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                    # "col.inactive_border" = "rgba(595959aa)";

                    resize_on_border = false;

                    allow_tearing = false;

                    layout = "dwindle";
                };

                decoration = {
                    rounding = 0;

                    # Change transparency of focused and unfocused windows
                    active_opacity = 0.92;
                    inactive_opacity = 0.92;
                    fullscreen_opacity = 1.0;

                    shadow = {
                        enabled = true;
                        range = 4;
                        render_power = 3;
                    };
                    # "col.shadow" = "rgba(1a1a1aee)";

                    blur = {
                        enabled = true;
                        size = 3;
                        passes = 1;
                        vibrancy = 0.1696;
                    };
                };

                animations = {
                    enabled = true;
                    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
                    animation = [
                        "windows, ${use_animation}, 7, myBezier"
                        "windowsOut, ${use_animation}, 7, default, popin 80%"
                        "border, ${use_animation}, 10, default"
                        "borderangle, ${use_animation}, 8, default"
                        "fade, ${use_animation}, 7, default"
                        "workspaces, ${use_animation}, 6, default"
                    ];
                };

                dwindle = {
                        pseudotile = true;
                        preserve_split = true;
                };

                master = {
                    new_status = "master";
                };

                misc = { 
                    force_default_wallpaper = 0;
                    disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
                    enable_swallow = true;
                    swallow_regex = "^(kitty)$";
                };

                input = {
                    kb_layout = "us";
                    kb_options = "compose:alt";
                    follow_mouse = 1;
                    sensitivity = 0;
                    touchpad = {
                        natural_scroll = false;
                    };
                };

                gestures = {
                    workspace_swipe = false;
                };
  
                "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

                bind = [
                    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
                    "$mainMod, RETURN, exec, $terminal"
                    "$mainMod, Q, exec, $terminal"
                    "$mainMod, C, killactive,"
                    "$mainMod SHIFT, Q, exit,"
                    "$mainMod, E, exec, $fileManager"
                    "$mainMod, V, togglefloating,"
                    "$mainMod, SPACE, togglefloating"
                    "$mainMod, R, exec, $menu"
                    "$mainMod, P, pseudo," # dwindle
                    "$mainMod, U, togglesplit," # dwindle
                    "$mainMod, F, fullscreen,"

                    # Screenshot
                    ", PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots"
                    "shift, PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"

                    # Move focus with mainMod + vim keys
                    "$mainMod, h, movefocus, l"
                    "$mainMod, l, movefocus, r"
                    "$mainMod, k, movefocus, u"
                    "$mainMod, j, movefocus, d"

                    # Alt Tab through windows
                    "ALT, TAB, cyclenext"
                    "ALT SHIFT, Tab, cyclenext, prev"
                    "$mainMod, Tab, exec, $windowSwitcher"

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
                ];

                # Move/resize windows with mainMod + LMB/RMB and dragging
                bindm = [
                    "$mainMod, mouse:272, movewindow"
                    "$mainMod, mouse:273, resizewindow"
                ];
                bindel = [
                    # Laptop multimedia keys for volume and LCD brightness
                    ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
                    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                    ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
                    ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
                ];
                windowrulev2 = [
                    "suppressevent maximize, class:.*" # You'll probably like this.
                    # Steam friends list
                    "float, class:(steam), initialTitle:(Friends List)"
                    "minsize 360 600, class:(steam), initialTitle:(Friends List)"
                    # Steam settings
                    "float, class:(steam), initialTitle:(Steam Settings)"
                ];      
            };
        };
    };
}
