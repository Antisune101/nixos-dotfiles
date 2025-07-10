{ config, lib, ... }: {
  imports = [
    ./kitty.nix
  ];

  # Module defaults
  kitty.enable = lib.mkDefault true;
}
