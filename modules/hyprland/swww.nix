{ lib, pkgs, userSettings, ... }:

{
  environment.systemPackages = with pkgs; [
    swww
    waypaper
  ];
  services.hyprpaper.enable = lib.mkForce false;

  home-manager.users.${userSettings.username} = {
    waylandwindowManager.hyprland.settings.exec-once = [ "swww-daemon" ];
  };
}
