{ pkgs, userSettings, ... }:

{
  home-manager.users.${userSettings.username}.programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      enable_audio_bell = false;
    };
   
  };
}
