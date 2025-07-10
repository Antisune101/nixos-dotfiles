{ config, lib, ... }:

{
    options = {
        librewolf.enable = lib.mkEnableOption "Enable librewolf browser";
    };
    
    config = lib.mkIf config.librewolf.enable {
        programs.librewolf = {
            enable = true;
        };
    };
}
