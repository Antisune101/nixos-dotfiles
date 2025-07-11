{ config, globalConfig, lib, ... }:

{
    imports = [
        ./hyprland.nix
        ./dunst.nix
    ];

    # Module defaults
    config = lib.mkIf globalConfig.hyprland.enable {
        hyprland.dunst.enable = lib.mkDefault true;
    };
}
