{ config, lib, pkgs, ... }:

{
    options = {
        yt-music.enable = lib.mkEnableOption "Enables youtube-music desktop app";
    };

    config = lib.mkIf config.yt-music.enable {
        home.packages = with pkgs; [
            youtube-music
        ];
    };
}
