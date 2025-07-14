{ config, lib, pkgs, userSettings, ... }:

{
    options = {
        jellyfin.enable = lib.mkEnableOption "Enables jellyfin media server";
    };

    config = lib.mkIf config.jellyfin.enable {
        environment.systemPackages = with pkgs; [
            jellyfin
            jellyfin-web
            jellyfin-ffmpeg
        ];

        services.jellyfin = {
            enable = true;
            openFirewall = true;
            user = userSettings.username; 
        };
    };
}
