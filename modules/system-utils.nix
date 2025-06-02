{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cowsay
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
