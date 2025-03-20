{ pkgs, userSettings, ... }:

{
  home-manager.users.${userSettings.username}.wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod SHIFT, RETURN, exec, $menu"
      "$mainMod, C, killactive"
      "$mainMod SHIFT, Q, exit"
      "$mainMod, W, exec, $changeWallpaper"
      # Launch file manager
      # mainMod + E for tui, mainMod SHIFT E for gui
      "$mainMod, E, exec, $tuiFileManager"
      "$mainMod SHIFT, E, exec, $guiFileManager"

      # Screenshot
      "$mainMod, PRINT, exec, $screenshotWindow"
      "$mainMod SHIFT, PRINT, exec, $screenshotArea"

      # =========== WINDOWS ==========
      # Cylce between and swap windows with J,K
      "$mainMod, J, layoutmsg, cyclenext"
      "$mainMod, K, layoutmsg, cycleprev"
      "$mainMod SHIFT, J, layoutmsg, swapnext"
      "$mainMod SHIFT, K, layoutmsg, swapprev"
      "$mainMod SHIFT, H, layoutmsg, swapwithmaster"

      # Expand and shrink split with H, L
      "$mainMod, H, layoutmsg, mfact -0.02"
      "$mainMod, L, layoutmsg, mfact +0.02"

      "$mainMod, TAB, layoutmsg, orientationnext"
      "$mainMod SHIFT, TAB, layoutmsg, orientationprev"
      
      # Move focus with mainMod + vim keys 
      # "$mainMod, h, movefocus, l"
      # "$mainMod, l, movefocus, r"
      # "$mainMod, k, movefocus, u"
      # "$mainMod, j, movefocus, d"

      # Move windows with mainMod Shift + vim keys
      # "$mainMod SHIFT, h, movewindow, l"
      # "$mainMod SHIFT, l, movewindow, r"
      # "$mainMod SHIFT, k, movewindow, u"
      # "$mainMod SHIFT, j, movewindow, d"

      # ========== WORKSPACES ==========
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

      # Scratchpads
      # Music
      "$mainMod, S, togglespecialworkspace, music"
      "$mainMod SHIFT, S, movetoworkspace, special:music"
      # Task Manager
      "$mainMod, T, togglespecialworkspace, taskmanager"
      "$mainMod SHIFT, T, movetoworkspace, special:taskmanager"

      # Media keys
      ", XF86AudioPlay, exec, playerctl --player=YoutubeMusic play-pause"
      ", XF86AudioStop, exec, playerctl --player=firefox play-pause"
      ", XF86AudioNext, exec, playerctl --player=YoutubeMusic next"
      ", XF86AudioPrev, exec, playerctl --player=YoutubeMusic previous"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
