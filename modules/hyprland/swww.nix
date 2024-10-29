{ lib, pkgs, userSettings, ... }:

{
  environment.systemPackages = with pkgs; [
    swww
    waypaper
  ];

  home-manager.users.${userSettings.username} = {
    wayland.windowManager.hyprland.settings.exec-once = [ "swww-daemon" ];
    services.hyprpaper.enable = lib.mkForce false;
  };
}
