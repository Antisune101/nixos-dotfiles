
{ config, lib, ... }:
{
    options = {
        syncthing.enable = lib.mkEnableOption "Enables Syncthing";
    };
    config = lib.mkIf config.syncthing.enable {
        services.syncthing.enable = true;
    };
}
