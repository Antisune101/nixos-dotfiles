{ config, lib, pkgs, inputs, system, ... }:

{
  options = {
    hyprland.enable = lib.mkEnableOption "Enable Hyprland Module";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${system}.hyprland;
      portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
    };
  };
}
