{ pkgs, inputs, userSettings, lib, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    base16Scheme = userSettings.base16Theme;
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
    };

    fonts = {
      serif = {
        package = userSettings.font.package;
        name = userSettings.font.name;
      };
      sansSerif = {
        package = userSettings.font.package;
        name = userSettings.font.name;
      };
      monospace = {
        package = userSettings.font.package;
        name = userSettings.font.name;
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  home-manager.users.${userSettings.username} = {
    stylix = {
      enable = true;

      iconTheme = {
          enable = true;
          package = pkgs.papirus-icon-theme;
          light = "Papirus Light";
          dark = "Papirus Dark";
      };

      targets.firefox.profileNames = [ "default" ];
    };
  };
}
