{ pkgs, userSettings, ... }:

{
  home-manager.users.${userSettings.username} = {
    services.swaync = {
      enable = true;
      settings = {
        widgets = [
          "mpris"
          "title"
          "dnd"
          "notifications"
        ];
      };
    };
  };
}
