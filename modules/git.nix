{ userSettings, ... }:

{
  home-manager.users.${userSettings.username}.programs.git = {
    enable = true;
    userName = userSettings.git.username;
    userEmail = userSettings.git.email;
    extraConfig.init.defaultBranch = "main";
  };
}
