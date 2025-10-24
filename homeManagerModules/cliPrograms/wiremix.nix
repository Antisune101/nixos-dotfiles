{ config, lib, pkgs, ... }:

{
    options = {
        wiremix.enable = lib.mkEnableOption "Enable wiremix audio mixer";
    };

    config = lib.mkIf config.wiremix.enable {
        home.packages = with pkgs; [ wiremix ];
    };
}
