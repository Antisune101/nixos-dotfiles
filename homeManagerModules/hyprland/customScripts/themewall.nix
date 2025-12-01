{ config, lib, pkgs, userSettings, ... }:
let 
    themewall = pkgs.writeShellScriptBin "themewall" ''
        rm ${config.hyprland.themedWallpaperDir}/*
        ${pkgs.gowall}/bin/gowall convert --dir ${config.hyprland.wallpaperDir} -t stylix --output ${config.hyprland.themedWallpaperDir}
  '';
in
{
    options.hyprland.customScripts.themewall.enable = lib.mkEnableOption "Enable random wallpaper utility";

    config = lib.mkIf config.hyprland.customScripts.themewall.enable {
        home.packages = with pkgs; [
            themewall
        ];
    };
}
