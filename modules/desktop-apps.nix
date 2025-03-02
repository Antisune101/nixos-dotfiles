{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    blender
    godot_4
    orca-slicer
    freecad-wayland
    youtube-music
    vesktop
    musescore
  ];
}
