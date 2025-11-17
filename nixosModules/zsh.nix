{ config, lib, pkgs, userSettings, ... }:

{
    options = {
        zsh.enable = lib.mkEnableOption "Enables zsh Unix shell";
    };

    config = lib.mkIf config.zsh.enable {
        users.users.${userSettings.username}.shell = pkgs.zsh;
        programs.zsh.enable = true;
    };
}
