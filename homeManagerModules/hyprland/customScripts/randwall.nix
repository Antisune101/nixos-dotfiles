{ config, lib, pkgs, userSettings, ... }:
let 
    dir = config.hyprland.customScripts.randwall.wallpaperDirectory;
    randwall = pkgs.writeShellScriptBin "randwall" ''
         #!/bin/sh
        CURRENT=$(basename "$(swww query | grep -oE '/[^ ]+\.(png|jpg|jpeg|gif|webp)')")
        WALLS=$(find ${dir} -type f | grep -E '\.(png|jpg|jpeg|gif|webp)$')

        if [ $(printf "%s\n" "$WALLS" | wc -l) -eq 1 ]; then
            NEW="$WALLS"
        else
            while : ; do
                CANDIDATE=$(printf "%s\n" "$WALLS" | shuf -n 1)
                [ "$(basename "$CANDIDATE")" != "$CURRENT" ] && NEW="$CANDIDATE" && break
            done
        fi

        swww img --transition-type=none "$NEW"
  '';
in
{
    options.hyprland.customScripts.randwall = {
        enable = lib.mkEnableOption "Enable random wallpaper utility";
        wallpaperDirectory = lib.mkOption {
            default = "${config.home.homeDirectory}/Pictures/Wallpapers";
            description = "Directory where wallpapers are stored";
        };
    };

    config = lib.mkIf config.hyprland.customScripts.randwall.enable {
        home.packages = with pkgs; [
            randwall
        ];
    };
}
