{ pkgs, inputs, userSettings, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/classic-dark.yaml";
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
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
}
