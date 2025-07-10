{ config, lib, ... }: {
  imports = [
    ./git.nix
    ./librewolf.nix
    ./kitty.nix
  ];

  # Module defaults
  git.enable = lib.mkDefault true;
  librewolf.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
}
