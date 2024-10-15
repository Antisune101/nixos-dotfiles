{ pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = lib.mkDefault "JetBrains Mono SemiBold 24";
    extraConfig = {
      show-icons = true;
      display-drun = "What we runnin?";
      drun-display-format = "{name}";
    };
  };
} 
