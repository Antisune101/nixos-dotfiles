{ config, lib, pkgs, inputs, system, ... }:

{
    options = {
        hyprland.enable = lib.mkEnableOption "Enable Hyprland Module";
        hyprland.monitors = lib.mkOption {
            default = "DP-1, 1920x1080@60, 0x0, 1";
            description = "Monitor config used when configuring hyprland through home-manager";
        };
    };

    config = lib.mkIf config.hyprland.enable {
        environment.systemPackages = with pkgs; [
            playerctl
            brightnessctl
        ];
        programs.hyprland = {
            enable = true;
            xwayland.enable = true;
            package = inputs.hyprland.packages.${system}.hyprland;
            portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
        };
    };
}
