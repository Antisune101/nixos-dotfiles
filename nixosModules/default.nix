{ lib, ... }:

{
  imports = [
    ./gc.nix
    ./hyprland
    ./home-manager.nix
    ./nvf.nix
    ./services/ddns-updater.nix
    ./services/jellyfin.nix
    ./services/kanata.nix
    ./services/openrgb.nix
    ./services/pipewire.nix
    ./services/printing.nix
    ./services/usb.nix
    ./steam.nix
    ./stylix.nix
  ];

    # Default module configuration
    hyprland.enable = lib.mkDefault true;
    homeManager.enable = lib.mkDefault true;
    jellyfin.enable = lib.mkDefault false;
    ddns-updater.enable = lib.mkDefault false;
    kanata.enable = lib.mkDefault true;
    nvf.enable = lib.mkDefault true;
    openrgb.enable = lib.mkDefault false;
    pipewire.enable = lib.mkDefault true;
    printing.enable = lib.mkDefault true;
    steam.enable = lib.mkDefault true;
    stylix.enable = lib.mkDefault true;
    usb.enable = lib.mkDefault true;
}
