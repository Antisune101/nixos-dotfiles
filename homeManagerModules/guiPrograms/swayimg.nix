{ config, lib, pkgs, ... }:

{
    options = {
        swayimg.enable = lib.mkEnableOption "Enable swayimg image viewer";
    };

    config = lib.mkIf config.swayimg.enable {
        programs.swayimg.enable = true;
    };
}
