{ lib, ... }:

{
  imports = [
    ./hyprland
    ./home-manager.nix
  ];

  # Default module configuration
  homeManager.enable = lib.mkDefault true;
}
