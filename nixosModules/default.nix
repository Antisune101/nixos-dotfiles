{ lib, ... }:

{
  imports = [
    ./1password.nix
    ./docker.nix
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
    ./services/syncthing.nix
    ./steam.nix
    ./stylix.nix
    ./vm.nix
    ./zsh.nix
  ];

    # Default module configuration
    _1password.enable = lib.mkDefault true;
    docker.enable = lib.mkDefault false;
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
    syncthing.enable = lib.mkDefault true;
    usb.enable = lib.mkDefault true;
    vm.enable = lib.mkDefault true;
    zsh.enable = lib.mkDefault true;
}
