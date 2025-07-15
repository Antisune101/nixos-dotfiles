{ config, lib, ... }: {
  imports = [
    ./cliPrograms/btop.nix
    ./cliPrograms/git.nix
    ./cliPrograms/yazi.nix
    ./hyprland
    ./guiPrograms/librewolf.nix
    ./guiPrograms/3d_printing.nix
    ./guiPrograms/kitty.nix
    ./guiPrograms/yt-music.nix
  ];

  # Module defaults
    threeDPrinting.enable = lib.mkDefault true;
    btop.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    librewolf.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    yazi.enable = lib.mkDefault true;
    yt-music.enable = lib.mkDefault true;
}
