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
    orca-slicer
    vesktop
    youtube-music
  ];  
}
