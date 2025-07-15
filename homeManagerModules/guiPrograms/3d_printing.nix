{ config, lib, pkgs, ... }:

{
    options = {
        threeDPrinting.enable = lib.mkEnableOption "Installs slicer software for 3d printing"; 
        threeDPrinting.slicer = lib.mkOption {
            default = "orca-slicer";
            description = "Which slicer software to install";
        };
    };
    config = lib.mkIf config.threeDPrinting.enable {
        home.packages = (
            if ( config.threeDPrinting.slicer == "bambu-studio" ) then [ pkgs.bambu-studio ] 
            else ( if (config.threeDPrinting.slicer == "orca-slicer" ) then [ pkgs.orca-slicer]
                else []
                )
            );
    };
}
