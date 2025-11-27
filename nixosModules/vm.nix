{ config, lib, pkgs, inputs, userSettings, ... }:

{
    options = {
        vm.enable = lib.mkEnableOption "Enables applications required to run virtual machines";
    };

    config = lib.mkIf config.vm.enable {
        environment.systemPackages = [pkgs.qemu];
        programs.virt-manager.enable = true;
        users.groups.libvirtd.members = [ userSettings.username ];
        users.users.${userSettings.username}.extraGroups = [ "libvirtd" ];
        virtualisation.libvirtd.enable = true;
        virtualisation.spiceUSBRedirection.enable = true;
        #        dconf.settings = {
        #   "org/virt-manager/connections" = {
        #       autoconnect = ["qemu:///system"];
        #       uris = ["qemu:///system"];
        #   };
        #};
    };
}
