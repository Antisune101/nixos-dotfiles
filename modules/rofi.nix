{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    # font = "JetBrainsMono Nerd Font 16";
    # theme = "gruvbox-dark-soft";
    # plugins = with pkgs; [ rofi-power-menu ];
    extraConfig = {
      show-icons = true;
      display-drun = "Applications";
      drun-display-format = "{name}";
    };
  };

}
