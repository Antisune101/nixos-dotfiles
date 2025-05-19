{ pkgs, userSettings, ... }:

{
  programs.adb.enable = true; 
  users.users.${userSettings.username}.extraGroups = ["adbusers"];
  environment.systemPackages = with pkgs; [
    android-tools
  ];
}
