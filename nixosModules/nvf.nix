{ config, lib, pkgs, inputs, ... }:

{
    options = {
        nvf.enable = lib.mkEnableOption "Enables nvf for configuring neovim";
    };

    imports = [
        inputs.nvf.nixosModules.default
    ];

    config = lib.mkIf config.nvf.enable {
        environment.systemPackages = with pkgs; [
            gcc
        ];

        programs.nvf = {
            enable = true;
            settings = {
                vim = {
                    lineNumberMode = "relative";
                    options.shiftwidth = 4;
                    telescope.enable = true;
                    autocomplete.nvim-cmp.enable = true;
                    lsp.enable = true;
                    languages = {
                        enableTreesitter = true;
                        enableFormat = true;

                        nix.enable = true;
                        rust.enable = true;
                    };
                };
            };
        };
    };
}
