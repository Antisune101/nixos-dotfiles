{ pkgs, userSettings, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  users.users.${userSettings.username}.shell = pkgs.zsh;

  programs.zsh.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.${userSettings.username}.programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history.path = "/home/${userSettings.username}/.cache/zsh/history";
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    sessionVariables = userSettings.shell.sessionVariables;
    shellAliases = userSettings.shell.aliases;
    
    initExtra = ''
      PROMPT="%F{red}[%f%B%F{yellow}%n%f%b%B%F{green}@%f%b%B%F{blue}%m%f%b %~%F{9}]%f$ "

      zstyle ':completion:*' menu select
      zmodload zsh/complist

      bindkey -v
      export KEYTIMEOUT=1

      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
    '';
  };
}
