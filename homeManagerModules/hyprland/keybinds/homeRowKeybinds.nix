{ config, lib, ... }:

{
    options = {
        hyprland.homeRowKeybindings.enable = lib.mkEnableOption "Whether to use home-row specialised keybinds";
    };

    config.wayland.windowManager.hyprland.settings = lib.mkIf config.hyprland.homeRowKeybinds.enable  {
        bind = [
            "$mainMod, N, exec, $terminal"
            "$mainMod SHIFT, N, exec, $menu"
            "$mainMod, V, killactive"
            "$mainMod SHIFT, Q, exit"
            "$mainMod CTRL, F, fullscreen"
            "$mainMod, SPACE, togglefloating"

            "$mainMod, A, workspace, 1"
            "$mainMod, S, workspace, 2"
            "$mainMod, D, workspace, 3"
            "$mainMod, F, workspace, 4"
            "$mainMod, J, workspace, 5"
            "$mainMod, K, workspace, 6"
            "$mainMod, L, workspace, 7"
            "$mainMod, ;, workspace, 8"

            "$mainMod SHIFT, A, movetoworkspace, 1"
            "$mainMod SHIFT, S, movetoworkspace, 2"
            "$mainMod SHIFT, D, movetoworkspace, 3"
            "$mainMod SHIFT, F, movetoworkspace, 4"
            "$mainMod SHIFT, J, movetoworkspace, 5"
            "$mainMod SHIFT, K, movetoworkspace, 6"
            "$mainMod SHIFT, L, movetoworkspace, 7"
            "$mainMod SHIFT, ;, movetoworkspace, 8"
        ];
    };
}
