{ config, lib, pkgs, userSettings, ... }:

{
    options = {
        steam.enable = lib.mkEnableOption "Enable steam for games :)";
    };

    config = lib.mkIf config.steam.enable {
        environment.systemPackages = with pkgs; [
           protonup-ng 
        ];
        environment.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${userSettings.username}/.steam/root/compatibilitytools.d";

        programs = {
            steam = {
                enable = true;
                gamescopeSession.enable = true;
            };
            gamemode.enable = true;
        };
    };
}
