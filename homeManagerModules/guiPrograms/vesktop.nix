{ config, lib, pkgs, ... }:

{
    options = {
        vesktop.enable = lib.mkEnableOption "Enable vesktop discord client";
    };

    config = lib.mkIf config.vesktop.enable {
        home.packages = with pkgs; [ vesktop ];
    };
}
