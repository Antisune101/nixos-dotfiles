{ config, lib, pkgs, globalConfig, userSettings, ... }:

{
    config = lib.mkIf globalConfig.zsh.enable {
        programs = {
            zsh = {
                enable = true;
                enableCompletion = true;
                syntaxHighlighting.enable = true;
                dotDir = ".config/zsh/";
                shellAliases = userSettings.shellAliases;
            };
            starship = {
                enable = true;
                enableZshIntegration = true;
            };
        };
    };
}
