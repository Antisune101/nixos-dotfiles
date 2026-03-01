{ config, lib, pkgs, globalConfig, userSettings, ... }:

{
    config = lib.mkIf globalConfig.zsh.enable {
        programs = {
            zsh = {
                enable = true;
                enableCompletion = true;
                autosuggestion.enable = true;
                syntaxHighlighting.enable = true;
                dotDir = "${config.home.homeDirectory}/.config/zsh/";
                shellAliases = userSettings.shellAliases;
                initContent = ''
                    function yy() { y; zle reset-prompt; zle redisplay;}
                    zle -N yy
                    bindkey '^y' yy
                '';
            };
            starship = {
                enable = true;
                enableZshIntegration = true;
            };
        };
    };
}
