{ config, lib, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "Enable Git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      extraConfig.init.defaultBranch = "main";
    };
  };
}
