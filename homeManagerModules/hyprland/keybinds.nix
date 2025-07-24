{ config, lib, ... }:

{
    options = {
        hyprland.homeRowKeybindings.enable = lib.mkEnableOption "Whether to use home-row specialised keybinds";
    };

    config.wayland.windowManager.hyprland.settings = lib.mkIf config.hyprland.homeRowKeybindings.enable {
        "$mainMod" = "SUPER";

        bind = ( if (config.hyprland.homeRowKeybindings.enable) then [
            "$mainMod, N, exec, $terminal"
            "$mainMod SHIFT, N, exec, $menu"
            "$mainMod, M, exec, $filemanager"
            "$mainMod, V, killactive"
            "ALT, F4, exit"
            "$mainMod CTRL, SPACE, fullscreen"
            "$mainMod, SPACE, togglefloating"

            "$mainMod, A, workspace, 1"
            "$mainMod, S, workspace, 2"
            "$mainMod, D, workspace, 3"
            "$mainMod, F, workspace, 4"
            "$mainMod, Q, workspace, 5"
            "$mainMod, W, workspace, 6"
            "$mainMod, E, workspace, 7"
            "$mainMod, R, workspace, 8"

            "$mainMod SHIFT, A, movetoworkspace, 1"
            "$mainMod SHIFT, S, movetoworkspace, 2"
            "$mainMod SHIFT, D, movetoworkspace, 3"
            "$mainMod SHIFT, F, movetoworkspace, 4"
            "$mainMod SHIFT, Q, movetoworkspace, 5"
            "$mainMod SHIFT, W, movetoworkspace, 6"
            "$mainMod SHIFT, E, movetoworkspace, 7"
            "$mainMod SHIFT, R, movetoworkspace, 8"
        ] else [
            "$mainMod, RETURN, exec, $terminal"
            "$mainMod SHIFT, RETURN, exec, $menu"
            "$mainMod, E, exec, $filemanager"
            "$mainMod, C, killactive"
            "$mainMod SHIFT, Q, exit"
            "$mainMod, F, fullscreen"
            "$mainMod, SPACE, togglefloating"

            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"

            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            ] ) ++ [
            # Window navigation with keyboard
            "$mainMod, K, cyclenext"
            "$mainMod, J, cyclenext, prev"
            "$mainMod, I, swapnext"
            "$mainMod, U, swapnext, prev"
            # Media keys
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPrev, exec, playerctl previous"
        ] ++ ( if (config.hyprland.hyprlock.enable) then [ "$mainMod, L, exec, playerctl --all-players pause; hyprlock" ] else [] );

        binde = if (config.hyprland.swayosd.enable) then [
            # Volume and Mic
            ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise --max-volume 100"
            ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
            ",PAUSE, exec, swayosd-client --input-volume mute-toggle"
            ",XF86AudioMute, exec, swayosd-client --input-volume mute-toggle"
            #Brightness
            ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
            ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
        ] else [
            # Volume and Mic
            ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",PAUSE, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            #Brightness
            ",XF86MonBrightnessUp, exec, brightnessctl s 5%-"
            ",XF86MonBrightnessDown, exec, brightnessctl s +5%"
            
        ] ;

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
    };
}
