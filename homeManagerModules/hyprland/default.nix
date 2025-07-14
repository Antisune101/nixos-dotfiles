{ config, globalConfig, lib, ... }:

{
    imports = [
        ./hyprland.nix
        ./keybinds
        ./hyprpolkit.nix
        ./dunst.nix
        ./rofi.nix
    ];

    # Module defaults
    config = lib.mkIf globalConfig.hyprland.enable {
        hyprland.enable = true;
        hyprland.dunst.enable = lib.mkDefault true;
        hyprland.homeRowKeybindings.enable = lib.mkIf globalConfig.kanata.enable true;
        hyprland.hyprpolkit.enable = lib.mkDefault true;
        hyprland.rofi.enable = lib.mkDefault true;
    };
}
