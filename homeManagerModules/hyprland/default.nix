{ config, globalConfig, lib, ... }:

{
    imports = [
        ./hyprland.nix
        ./keybinds.nix
        ./hyprpolkit.nix
        ./dunst.nix
        ./rofi.nix
        ./swayosd.nix
        ./swww.nix
        ./waybar.nix
    ];

    # Module defaults
    config.hyprland = lib.mkIf globalConfig.hyprland.enable {
        enable = true;
        dunst.enable = lib.mkDefault true;
        homeRowKeybindings.enable = lib.mkIf globalConfig.kanata.enable true;
        hyprpolkit.enable = lib.mkDefault true;
        rofi.enable = lib.mkDefault true;
        swayosd.enable = lib.mkDefault true;
        swww.enable = lib.mkDefault true;
        waybar.enable = lib.mkDefault true;
    };
}
