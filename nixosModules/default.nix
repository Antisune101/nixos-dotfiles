{ lib, ... }:

{
  imports = [
    ./hyprland
    ./home-manager.nix
    ./nvf.nix
    ./services/pipewire.nix
  ];

  # Default module configuration
  hyprland.enable = lib.mkDefault true;
  homeManager.enable = lib.mkDefault true;
  nvf.enable = lib.mkDefault true;
  pipewire.enable = lib.mkDefault true;
}
