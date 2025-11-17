{ config, lib, ... }:

{
    options = {
        kitty.enable = lib.mkEnableOption "Enables kitty terminal emulator";
    };

    config = lib.mkIf config.kitty.enable {
        programs.kitty = {
            enable = true;
            settings = {
                background_opacity = lib.mkForce 0.8;
            };
        };
    };
}
