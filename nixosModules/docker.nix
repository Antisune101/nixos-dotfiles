{ config, lib, pkgs, userSettings, ... }:

{
    options = {
        docker.enable = lib.mkEnableOption "Enables docker virualisation";
    };
    
    config = lib.mkIf config.docker.enable {
        environment.systemPackages = with pkgs; [ docker-compose ] ;
        virtualisation.docker = {
            enable = true;
            rootless = {
                enable = true;
                setSocketVariable = true;
            };
        };
        users.users.${userSettings.username}.extraGroups = [ "docker" ];
    };
}
