
{ config, lib, pkgs, ... }:

{
    options = {
        mpv.enable = lib.mkEnableOption "Enable mpv media player";
    };

    config = lib.mkIf config.mpv.enable {
        home.packages = with pkgs; [ mpv ];
    };
}
