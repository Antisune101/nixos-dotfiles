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
                    (defsrc caps a s d f j k l ; )
                    (defvar tap-hold-timeout 200)
                    (defalias bettercap (tap-dance $tap-hold-timeout ( esc  ( switch ((layer homeMod)) (layer-switch default) break ((layer default)) (layer-switch homeMod) break ))))
                    (deflayer
                        homeMod
                        @bettercap
                        (tap-hold $tap-hold-timeout $tap-hold-timeout a lmet)
                        (tap-hold $tap-hold-timeout $tap-hold-timeout s lalt)
                        (tap-hold $tap-hold-timeout $tap-hold-timeout d lsft)
                        (tap-hold $tap-hold-timeout $tap-hold-timeout f lctl)
                        (tap-hold $tap-hold-timeout $tap-hold-timeout j lctl)
                        (tap-hold $tap-hold-timeout $tap-hold-timeout k lsft)
                        (tap-hold $tap-hold-timeout $tap-hold-timeout l lalt)
                        (tap-hold $tap-hold-timeout $tap-hold-timeout ; lmet)
                    )
                    (deflayer
                        default
                        @bettercap
                        a
                        s
                        d
                        f
                        j
                        k
                        l
                        ;
                    )
                '';
            };
        };
    };
}
