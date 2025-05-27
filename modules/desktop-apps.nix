{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blender
    brave
    cava
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
    vscode
    youtube-music
    zed-editor
  ];  
}
