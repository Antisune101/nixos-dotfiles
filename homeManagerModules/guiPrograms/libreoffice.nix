{ config, lib, pkgs, ... }:

{
    options = {
        libreoffice.enable = lib.mkEnableOption "Enables libreoffice suite";
    };

    config = lib.mkIf config.libreoffice.enable {
        home.packages = with pkgs; [ libreoffice ];
    };
}
