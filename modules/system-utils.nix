{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cowsay
    fastfetch
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
