{ userSettings, inputs, ... }:
{
  home-manager.users.${userSettings.username} = {
    imports = [ inputs.textfox.homeManagerModules.default ];

    textfox = {
      enable = true;
      profile = "default";
    };
    programs.firefox = {
      enable = true;
    };
  };
}
