{ config, lib, inputs, ... }:

{
  options = {
    nvf.enable = lib.mkEnableOption "Enables nvf for configuring neovim";
  };

  imports = [
    inputs.nvf.nixosModules.default
  ];

  config = lib.mkIf config.nvf.enable {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          lineNumberMode = "relative";
          options.shiftwidth = 4;
        };
      };
    };
  };

}
