{ config, lib, pkgs, ... }:

{
    options = {
        audacity.enable = lib.mkEnableOption "Enables audacity";
    };

    config = lib.mkIf config.audacity.enable {
        home.packages = with pkgs; [ audacity ];
    };
}
