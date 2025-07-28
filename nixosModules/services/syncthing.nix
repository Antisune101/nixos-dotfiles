{ config, lib, userSettings, ... }:

{
    options = {
        syncthing.enable = lib.mkEnableOption "Enables Syncthing";
    };
    config = lib.mkIf config.syncthing.enable {
        services.syncthing = {
            enable = true;
            user = userSettings.username;
            dataDir = "/home/${userSettings.username}/Sync";
            configDir = "/home/${userSettings.username}/.config/syncthing";
        };
    };
}
