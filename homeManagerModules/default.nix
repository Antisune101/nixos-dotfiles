{ config, lib, globalConfig, ... }: {
  imports = [
    ./cliPrograms/btop.nix
    ./cliPrograms/git.nix
    ./cliPrograms/yazi.nix
    ./hyprland
    ./guiPrograms/3d_printing.nix
    ./guiPrograms/godot.nix
    ./guiPrograms/kitty.nix
    ./guiPrograms/librewolf.nix
    ./guiPrograms/musescore.nix
    ./guiPrograms/obsidian.nix
    ./guiPrograms/vesktop.nix
    ./guiPrograms/yt-music.nix
    ./stylix.nix
  ];

  # Module defaults
    threeDPrinting.enable = lib.mkDefault true;
    btop.enable = lib.mkDefault true;
    godot.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
    librewolf.enable = lib.mkDefault true;
    musescore.enable = lib.mkDefault true;
    obsidian.enable = lib.mkDefault true;
    stylix.enable = lib.mkDefault globalConfig.stylix.enable;
    yazi.enable = lib.mkDefault true;
    vesktop.enable = lib.mkDefault true;
    yt-music.enable = lib.mkDefault true;
}
