{ config, lib, inputs, userSettings, ... }:
let
    globalConfig = config;
in {
  options = {
    homeManager.enable = lib.mkEnableOption "Whether to enable the home-manager module";
  };

  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config = lib.mkIf config.homeManager.enable {
    home-manager = {
      extraSpecialArgs = { inherit inputs; inherit userSettings; inherit globalConfig; };
      backupFileExtension = "backup";
            useUserPackages = true;
      users.${userSettings.username} = {
        imports = [
          inputs.self.outputs.homeManagerModules.default
        ];

        home.username = userSettings.username;
        home.homeDirectory = "/home/${userSettings.username}";
        home.stateVersion = "25.05";
      };
    };
  };
}
