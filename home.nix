{ userSettings, pkgs, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = userSettings.homeDir;

  home.stateVersion = "24.11";
}
