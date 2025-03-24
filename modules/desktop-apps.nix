{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    floorp
    freecad
    gimp
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
