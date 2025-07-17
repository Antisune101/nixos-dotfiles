{ config, lib, pkgs, ... }:
{
    options = {
        obsidian.enable = lib.mkEnableOption "Enables Obsidian note-taking program";
    };

    config = lib.mkIf config.obsidian.enable {
        home.packages = with pkgs; [ obsidian ]; 
    };
}
