{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font 16";
    theme = "gruvbox-dark-soft";
    extraConfig = {
      show-icons = true;
      display-drun = "Applications";
      drun-display-format = "{name}";
    };
  };

}
