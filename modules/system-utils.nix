{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprshot
    mpv
    nautilus
    gnome-text-editor
    networkmanagerapplet
    playerctl
    swww
    hyprpolkitagent
  ];  
}
