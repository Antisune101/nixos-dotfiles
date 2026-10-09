{
  flake.nixosModules.syncthing = { config, ... }:
  let
    username = config.preferences.user.name;
  in {
    services.syncthing =  {
      enable = true;
      user = config.preferences.user.name;
      dataDir = "/home/${username}/sync";
      configDir = "/home/${username}/.config/syncthing";
      
    };
  }; 
}
