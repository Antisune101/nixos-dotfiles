{ config, lib, ... }:

{
    options = {
        yt-dlp.enable = lib.mkEnableOption "Enables yt-dlp system monitor";
    };

    config = lib.mkIf config.yt-dlp.enable {
        programs.yt-dlp.enable = true;
    };
}
