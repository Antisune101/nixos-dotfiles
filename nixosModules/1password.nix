{ config, lib, pkgs, ... }:

{
    options = {
        _1password.enable = lib.mkEnableOption "Enables 1Password password-manager";
    };

    config = lib.mkIf config._1password.enable {
        programs._1password.enable = true;
        programs._1password-gui = {
            enable = true;
            polkitPolicyOwners = [ "antisune" ];
        };
    };
}
