{ config, globalConfig, inputs, system, lib, ... }:

{
    options.hyprland = {
        enable = lib.mkEnableOption "Enable hyprland for home-manager";
        wallpaperDir = lib.mkOption {
            default = "${config.home.homeDirectory}/Pictures/Wallpapers/wallpapers";
            description = "Directory where wallpapers are stored";
        };
        themedWallpaperDir = lib.mkOption {
            default = "${config.home.homeDirectory}/Pictures/Wallpapers/themed_wallpapers";
            description = "Directory where themed wallpapers are stored";
        };
    };


    config = lib.mkIf config.hyprland.enable  {
        wayland.windowManager.hyprland = {
            enable = true;
            package = inputs.hyprland.packages.${system}.hyprland;
            portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
            settings = {
                "$terminal" = "kitty";
                "$filemanager" = "$terminal yazi";
                "$menu" = "rofi -show drun";

                exec-once = ( if config.hyprland.waybar.enable then [ "waybar" ] else [] )
                    ++ ( if config.hyprland.hyprpolkit.enable then [ "systemctl --user start hyprpolkitagent" ] else [] )
                    ++ ( if config.hyprland.swww.enable then [ "swww-daemon" ] else [] )
                    ++ ( if config.hyprland.swayosd.enable then [ "systemctl --user start swayosd" ] else [] );

                monitor = globalConfig.hyprland.monitors;

                env = [
                    "XCURSOR_SIZE,24"
                    "HYPRCURSOR_SIZE,24"
                ];

                general = {
                    gaps_in = 3;
                    gaps_out = 6;
                    border_size = 2;
                    allow_tearing = false;
                    layout = "master";
                };

                decoration = {
                    rounding = 0;

                    shadow = {
                        enabled = false;
                        range = 4;
                        render_power = 3;
                        # TODO: move these to a module that get's disabled if you use stylix
                        # color = "rgba(1a1a1aee)"
                    };

                    blur = {
                        enabled = true;
                        size = 3;
                        passes = 1;
                        vibrancy = 0.1696;
                    };
                };

                animations.enabled = false;

                master = {
                    new_status = "master";
                    mfact = 0.55;
                };

                misc = {
                    force_default_wallpaper = 0;
                    disable_hyprland_logo = true;
                };

                input = {
                    kb_layout = "us";
                    kb_options = "compose:alt";
                    follow_mouse = 1;
                    sensitivity = 0;
                    numlock_by_default = true;
                };
            };
        };
    };
}
