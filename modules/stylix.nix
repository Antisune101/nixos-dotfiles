{ pkgs, inputs, userSettings, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = userSettings.cursorSize;
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

  home-manager.users.${userSettings.username}.stylix = {
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      light = "Papirus-Light";
      dark = "Papirus-Dark";
    };
    targets.waybar.enable = false;
  };
}
