{ config, lib, ... }: {
  imports = [
    ./git.nix
    ./kitty.nix
  ];

  # Module defaults
  git.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
}
