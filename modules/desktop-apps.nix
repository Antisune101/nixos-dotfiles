{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blender
    brave
    freecad-wayland
    godot_4
    musescore
    nautilus
    obs-studio
    orca-slicer
    vesktop
    youtube-music
  ];
}
