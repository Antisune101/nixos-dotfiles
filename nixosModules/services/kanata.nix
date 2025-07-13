{ config, lib, userSettings, ... }:

{
    options = {
        kanata.enable = lib.mkEnableOption "Enable kanata key remapper";
        kanata.devices = lib.mkOption {
            default = [];
        };
    };

    config = lib.mkIf config.kanata.enable {
        boot.kernelModules = [ "uinput" ];

        hardware.uinput.enable = true;

        services.udev.extraRules = ''
            KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
        '';

        users.groups.uinput = { };

        users.users.${userSettings.username}.extraGroups = [ "uinput" ];

        systemd.services.kanata-internalKeyboard.serviceConfig = {
            SupplementaryGroups = [
                "input"
                "uinput"
            ];
        };

        services.kanata = {
            enable = true;
            keyboards.internalKeyboard = {
                devices = config.kanata.devices;
                extraDefCfg = "process-unmapped-keys yes";
                config = ''
                    (defsrc a s d f j k l ; )
                    (deflayer
                        homeMod
                        (tap-hold 200 200 a lmet)
                        (tap-hold 200 200 s lalt)
                        (tap-hold 200 200 d lsft)
                        (tap-hold 200 200 f lctl)
                        (tap-hold 200 200 j lctl)
                        (tap-hold 200 200 k lsft)
                        (tap-hold 200 200 l lalt)
                        (tap-hold 200 200 ; lmet)
                    )
                '';
            };
        };
    };
}
