{ pkgs, userSettings, ... }:

{
  home-manager.users.${userSettings.username}.programs.bemenu = {
    enable = true;
    settings = {
      line-height = userSettings.hyprland.bar_height;
      prompt = "What we runnin? ";
      ignorecase = true;
    };
  };
}
