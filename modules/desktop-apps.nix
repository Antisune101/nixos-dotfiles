{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    floorp
    freecad
    gimp
    krita
    musescore
    obsidian
    orca-slicer
    vesktop
    youtube-music
  ];  
}
