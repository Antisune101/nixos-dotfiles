{ pkgs, userSettings, ... }:

{
  home-manager.users.${userSettings.username}.programs.rofi = {
    enable = true;
  };
}
