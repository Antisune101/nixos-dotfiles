{ config, lib, ... }:

{
    options = {
        kitty.enable = lib.mkEnableOption "Enables kitty terminal emulator";
    };

    config = lib.mkIf config.kitty.enable {
        programs.kitty = {
            enable = true;
            settings = {
                font_size = 18;
                background_opacity = lib.mkForce 0.8;
            };
        };
    };
}
