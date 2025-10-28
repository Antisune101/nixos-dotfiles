{ config, lib, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "Enable Git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      settings.init.defaultBranch = "main";
    };
  };
}
