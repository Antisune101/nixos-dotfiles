{ userSettings, ... }:
{
  programs.git = {
    enable = true;
    userName = userSettings.username;
    userEmail = userSettings.userEmail;
    extraConfig.init.defaultBranch = "main";
  };
}
