
{ config, lib, pkgs, ... }:

{
    options = {
        bottles.enable = lib.mkEnableOption "Enables bottles";
    };

    config = lib.mkIf config.bottles.enable {
        home.packages = with pkgs; [ bottles ];
    };
}
