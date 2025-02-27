{ pkgs, inputs, userSettings, ... }:

{
  imports = [
    inputs.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox"
    polarity = "dark";

    font = {
      serif = {
        package = userSettings.font.package;
        name = "JetBrains Nerdfont Serif";
      };
      sansSerif = {
        package = userSettings.font.package;
        name = "JetBrains Nerdfont Sans";
      };
      monospace = {
        package = userSettings.font.package;
        name = "JetBrains NerdFont Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emji;
        name = "Noto Color Emoji";
      };
    };
  }
}
