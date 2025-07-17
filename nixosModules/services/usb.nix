{ config, lib, pkgs, ... }:
{
    options = {
        usb.enable = lib.mkEnableOption "Enables usb auto-mounting";
    };

    config = lib.mkIf config.usb.enable {
        services = {
            gvfs.enable = true;
            udisks2.enable = true;
            devmon.enable = true;
        };
        environment.systemPackages = with pkgs; [
            usbutils
            udiskie
            udisks
        ];
    };
}
