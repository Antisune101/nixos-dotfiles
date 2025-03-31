{ pkgs, userSettings, inputs, ... }:

{
  home-manager.users.${userSettings.username} = {
    imports = [ inputs.textfox.homeManagerModules.default ];
    enable = true;
    profile = "textfoxTest";
  };
}
