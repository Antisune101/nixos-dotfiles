{ config, lib, ... }:

{
    options = {
        librewolf.enable = lib.mkEnableOption "Enable librewolf browser";
    };
    
    config = lib.mkIf config.librewolf.enable {
        stylix.targets.librewolf.profileNames = [ "default" ]; 
        programs.librewolf = {
            enable = true;
        };
    };
}
