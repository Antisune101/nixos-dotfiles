{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    floorp
    freecad
    gimp
    godot_4
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
