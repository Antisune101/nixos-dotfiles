{ config, globalConfig, lib, ... }:

{
    imports = [
        ./hyprland.nix
        ./hyprpolkit.nix
        ./dunst.nix
        ./rofi.nix
    ];

    # Module defaults
    config = lib.mkIf globalConfig.hyprland.enable {
        hyprland.dunst.enable = lib.mkDefault true;
        hyprland.hyprpolkit.enable = lib.mkDefault true;
        hyprland.rofi.enable = lib.mkDefault true;
    };
}
