{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blender
    brave
    freecad-wayland
    godot_4
    musescore
    mpv
    nautilus
    obs-studio
    orca-slicer
    prismlauncher
    vesktop
    youtube-music
  ];
}
