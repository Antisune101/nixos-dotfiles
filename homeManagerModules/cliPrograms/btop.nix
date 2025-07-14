{ config, lib, ... }:

{
    options = {
        btop.enable = lib.mkEnableOption "Enables btop system monitor";
    };

    config = lib.mkIf config.btop.enable {
        programs.btop = {
            enable = true;
            settings = {
                vim_keys = true;
                rounded_corners = false;
            };
        };
    };
}
