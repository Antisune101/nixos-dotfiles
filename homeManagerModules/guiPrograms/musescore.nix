{ config, lib, pkgs, ... }:
{
    options = {
        musescore.enable = lib.mkEnableOption "Enabes musescore annotation software";
    };

    config = lib.mkIf config.musescore.enable {
        home.packages = with pkgs; [ musescore ];
    };
}
