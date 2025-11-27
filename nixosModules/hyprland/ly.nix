{ config, lib, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    services.displayManager.ly = {
      enable = true;
      settings = {
        animate = true;
        animation = "matrix";
      };
    };
  };
}
