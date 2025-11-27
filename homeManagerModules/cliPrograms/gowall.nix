{ config, lib, pkgs, ... }:

{
    options = {
        gowall.enable = lib.mkEnableOption "Enable gowall wallpaper theming tool";
    };

    config = lib.mkIf config.gowall.enable {
        home.packages = with pkgs; [ gowall ];
    };
}
