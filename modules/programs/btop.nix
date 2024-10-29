{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      rounder_cornders = false;
    };
  };
}
