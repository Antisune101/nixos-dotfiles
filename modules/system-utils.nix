{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprshot
    mpv
    nautilus
    networkmanagerapplet
    playerctl
    swww
    hyprpolkitagent
  ];  
}
