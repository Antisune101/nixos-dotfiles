{ inputs, pkgs, userSettings, ... }:

{
	programs.hyprland = {
			enable = true;
			xwayland.enable = true;
			package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
			portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
	};
		
	home-manager.users.${userSettings.username}.wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			monitor = ",preferred,auto,auto";
			"$terminal" = userSettings.terminal;
			"$terminalFilemanager" = "${userSettings.terminal} yazi";
			"$guiFilemanager" = "nautilus";
			"$menu" = userSettings.hyprland.menu;

			env = [
				"XCURSOR_SIZE,24"
				"HYPRCURSOR_SIZE,24"
			];

			general = {
				gaps_in = 5;
				gaps_out = 10;
				border_size = 4;
				resize_on_border = false;
				allow_tearing = false;
				layout = "master";
			};

			decoration = {
				rounding = 0;
				shadow = {
					enabled = true;
					range = 4;
					render_power = 3;
					# color = "rgba(1a1a1aee)";
				};

				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				};
			};
			
			dwindle = {
				pseudotile = true;
				preserve_split = true;
			};

			master = {
				new_status = "master";
			};


			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
				enable_swallow = true;
				swallow_regex = "^(kitty)$";
			};

			animations.enabled = false;

			input = {
				kb_layout = "us";
				kb_options = "compose:alt";
				follow_mouse = 1;
				sensitivity = 0;
				touchpad.natural_scroll = false;
			};

		};
	};
}
