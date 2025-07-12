{ config, lib, ... }: {
  imports = [
    ./git.nix
    ./hyprland
    ./librewolf.nix
    ./kitty.nix
  ];

  # Module defaults
    git.enable = lib.mkDefault true;
    librewolf.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
}
