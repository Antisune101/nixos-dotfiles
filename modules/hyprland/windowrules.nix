{ pkgs, userSettings, ... }:

{
  home-manager.users.${userSettings.username}.wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "workspace special:music, initialTitle:(YouTube Music)"
      "workspace special:discord, class:(vesktop)"
    ];
  };
}
