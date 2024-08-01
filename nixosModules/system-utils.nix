{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wl-clipboard
    usbutils
    udiskie
    udisks
    gparted
    xorg.xhost
    polkit_gnome
  ];

  services = {
    # USB
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };
}
