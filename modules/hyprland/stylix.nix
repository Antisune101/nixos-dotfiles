{ pkgs, inputs, userSettings, ... }:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.stylixYamlTheme}.yaml";
    polarity = "dark";
    image = ./placeholder.jpg;

    cursor = {
      size = 24;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts=["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    opacity = {
      terminal = 0.75;
      applications = 0.75;
    };
  };

  home-manager.users.${userSettings.username}.stylix = {
    enable = true;
    targets.rofi.enable = false;
  };
}
