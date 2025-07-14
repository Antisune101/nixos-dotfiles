{ config, lib, ... }:
{
    options = {
        ddns-updater.enable = lib.mkEnableOption "Enables ddns-updater";
    };
    config = lib.mkIf config.ddns-updater.enable {
        services.ddns-updater.enable = true;
    };
}
