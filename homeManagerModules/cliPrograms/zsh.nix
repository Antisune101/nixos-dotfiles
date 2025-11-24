{ config, lib, pkgs, globalConfig, userSettings, ... }:

{
    config = lib.mkIf globalConfig.zsh.enable {
        programs = {
            zsh = {
                enable = true;
                enableCompletion = true;
                autosuggestion.enable = true;
                syntaxHighlighting.enable = true;
                dotDir = ".config/zsh/";
                shellAliases = userSettings.shellAliases;
                initContent = ''
                    function yyy() { yy; zle reset-prompt; zle redisplay;}
                    zle -N yyy
                    bindkey '^y' yyy
                '';
            };
            starship = {
                enable = true;
                enableZshIntegration = true;
            };
        };
    };
}
