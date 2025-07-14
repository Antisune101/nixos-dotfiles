{ config, lib, ... }: {
    config.wayland.windowManager.hyprland.settings = lib.mkIf config.hyprland.enable {
        bind = [
            ", XF86AudioPlay, exec, playerctl --player=YoutubeMusic play-pause"
            ", XF86AudioStop, exec, playerctl --player=firefox play-pause"
            ", XF86AudioNext, exec, playerctl --player=YoutubeMusic next"
            ", XF86AudioPrev, exec, playerctl --player=YoutubeMusic previous"
        ];
        binde = [
            # Volume and Mic
            ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",PAUSE, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
    };
}
