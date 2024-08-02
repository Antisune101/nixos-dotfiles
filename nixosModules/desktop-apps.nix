{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neofetch
    btop
    kitty
    rofi
    nsxiv
    mpv
    nautilus
    libreoffice
    obsidian
    gnome-calculator
    brave
    obs-studio
    godot_4
    gimp
    blender
    reaper
    audacity
    zed-editor    
  ];
}
