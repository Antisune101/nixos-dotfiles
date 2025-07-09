{ lib, ... }:

{
  imports = [
    ./hyprland
    ./home-manager.nix
  ];

  # Default module configuration
  hyprland.enable = lib.mkDefault true;
  homeManager.enable = lib.mkDefault true;
}
