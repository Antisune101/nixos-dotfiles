{ config, lib, ... }: {
  imports = [
    ./cliPrograms/btop.nix
    ./cliPrograms/git.nix
    ./cliPrograms/yazi.nix
    ./hyprland
    ./guiPrograms/librewolf.nix
    ./guiPrograms/kitty.nix
  ];

  # Module defaults
    btop.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    librewolf.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    yazi.enable = lib.mkDefault true;
}
