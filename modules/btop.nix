{ pkgs, userSettings, ... }:

{
  home-manager.users.${userSettings.username}.programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      vim_keys = true;
      rounder_corners = false;
    };
  };
}
