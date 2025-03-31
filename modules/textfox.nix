{ pkgs, userSettings, inputs, ... }:

{
  home-manager.users.${userSettings.username} = {
    imports = [ inputs.textfox.homeManagerModules.default ];
    stylix.targets.firefox.profileNames = [ "textfoxTest" ];
    textfox = {
      enable = true;
      profile = "textfoxTest";
      useLegacyExtensions = false;
    };
  };
}
