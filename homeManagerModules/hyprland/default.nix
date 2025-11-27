{ config, globalConfig, lib, ... }:

{
    imports = [
        ./customScripts/randwall.nix
        ./hyprland.nix
        ./hyprlock.nix
        ./keybinds.nix
        ./hyprpolkit.nix
        ./dunst.nix
        ./flameshot.nix
        ./rofi.nix
        ./swayosd.nix
        ./swww.nix
        ./waybar.nix
    ];

    # Module defaults
    config.hyprland = lib.mkIf globalConfig.hyprland.enable {
        enable = true;
        customScripts.randwall.enable = lib.mkDefault true;
        dunst.enable = lib.mkDefault true;
        flameshot.enable = lib.mkDefault true;
        homeRowKeybindings.enable = lib.mkIf globalConfig.kanata.enable true;
        hyprlock.enable = lib.mkDefault true;
        hyprpolkit.enable = lib.mkDefault true;
        rofi.enable = lib.mkDefault true;
        swayosd.enable = lib.mkDefault true;
        swww.enable = lib.mkDefault true;
        waybar.enable = lib.mkDefault true;
    };
}
