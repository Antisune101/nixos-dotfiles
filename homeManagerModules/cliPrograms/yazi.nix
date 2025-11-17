{ config, lib, ... }:

{
    options = {
        yazi.enable = lib.mkEnableOption "Enable yazi tui file manager";
    };

    config = lib.mkIf config.yazi.enable {
        programs.yazi = {
            enable = true;
            enableZshIntegration = true;
        };
    };
}
