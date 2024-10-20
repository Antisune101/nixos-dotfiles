{ pkgs, ... }:

{
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
}
