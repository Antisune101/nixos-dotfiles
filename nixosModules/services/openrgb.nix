{ config, lib, ... }:
{
    options = {
        openrgb.enable = lib.mkEnableOption "Enable openrbg to make peripherals nice :)";
    };

    config = lib.mkIf config.openrgb.enable {
        services.hardware.openrgb = {
            enable = true;
        };
    };
}
