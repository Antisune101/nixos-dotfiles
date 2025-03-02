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
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = userSettings.font.package;
        name = "JetBrainsMono Nerd Font";
      };
      monospace = {
        package = userSettings.font.package;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
