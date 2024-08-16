{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    udev
    alsa-lib
    vulkan-loader
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
    libxkbcommon wayland
  ];
}
