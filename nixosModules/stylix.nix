{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ./_stylix-wallpaper.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 12;
    };
    fonts = let font = {package = pkgs.fira; name = "Fira Mono"; }; in {
      monospace = font;
      serif= font;
      sansSerif = font;
      
    };

  };

  home-manager.users.antisune = {
    stylix.targets = {
      helix.enable = false;
      rofi.enable = false;
    };
  };
}
