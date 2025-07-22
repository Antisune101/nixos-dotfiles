{ config, lib, pkgs, ... }:

{
    options = {
        godot.enable = lib.mkEnableOption "Enables godot";
    };

    config = lib.mkIf config.godot.enable {
        home.packages = with pkgs; [ godot ];
    };
}
