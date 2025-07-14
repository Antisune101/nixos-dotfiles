{ config, lib, inputs, pkgs, ... }:

{
    imports = [
        inputs.stylix.nixosModules.stylix
    ];

    stylix = {
        enable = lib.mkDefault true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
          size = 24;
        };
    };

}
