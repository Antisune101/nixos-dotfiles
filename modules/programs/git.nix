{ userSettings, ... }:
{
  programs.git = {
    enable = true;
    userName = userSettings.git.username;
    userEmail = userSettings.git.email;
    extraConfig.init.defaultBranch = "main";
  };
}
