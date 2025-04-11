{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    chromium
    firefox
    floorp
    freecad
    gimp
    godot_4
    kdePackages.kdenlive
    krita
    libreoffice
    musescore
    obsidian
    obs-studio
    orca-slicer
    vesktop
    youtube-music
  ];  
}
