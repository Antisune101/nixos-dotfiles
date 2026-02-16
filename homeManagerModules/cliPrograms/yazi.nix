{ config, lib, inputs, system, ... }:

{
    imports = [
        (inputs.nix-yazi-plugins.legacyPackages.${system}.homeManagerModules.default)
    ];

    options = {
        yazi.enable = lib.mkEnableOption "Enable yazi tui file manager";
    };

    config = lib.mkIf config.yazi.enable {
        programs.yazi = {
            enable = true;
            enableZshIntegration = true;
            shellWrapperName = "y";
            yaziPlugins = {
                enable = true;
                plugins = {
                    full-border.enable = true;
                    starship.enable = true;
                };
            };
        };
    };
}
