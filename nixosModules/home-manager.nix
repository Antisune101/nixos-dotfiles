{ config, lib, inputs, userSettings, ... }: {
  options = {
    homeManager.enable = lib.mkEnableOption "Whether to enable the home-manager module";
  };

  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config = lib.mkIf config.homeManager.enable {
    home-manager = {
      extraSpecialArgs = { inherit inputs; inherit userSettings; };
      backupFileExtension = "backup";
      users.${userSettings.username} = {
        home.username = userSettings.username;
        home.homeDirectory = "/home/${userSettings.username}";
        home.stateVersion = "25.05";
      };
    };
  };
}
