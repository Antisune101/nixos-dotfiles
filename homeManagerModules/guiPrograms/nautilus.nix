{ config, lib, pkgs, ... }:

{
    options = {
        nautilus.enable = lib.mkEnableOption "Enables nautilus file manager";
    };

    config = lib.mkIf config.nautilus.enable {
        home.packages = with pkgs; [ nautilus ];
    };
}
