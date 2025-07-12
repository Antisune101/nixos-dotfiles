{ lib, ... }:

{
  imports = [
    ./gc.nix
    ./hyprland
    ./home-manager.nix
    ./nvf.nix
    ./services/pipewire.nix
    ./steam.nix
  ];

  # Default module configuration
  hyprland.enable = lib.mkDefault true;
  homeManager.enable = lib.mkDefault true;
  nvf.enable = lib.mkDefault true;
  pipewire.enable = lib.mkDefault true;
    steam.enable = lib.mkDefault true;
}
