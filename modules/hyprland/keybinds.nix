{ userSettings, ... }:

{
	home-manager.users.${userSettings.username}.wayland.windowManager.hyprland.settings = {
		"$mainMod" = "SUPER";
		bind = [
		 # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
			"$mainMod, RETURN, exec, $terminal"
			"$mainMod, Q, exec, $terminal"
			"$mainMod, C, killactive,"
			"$mainMod SHIFT, Q, exit,"
			"$mainMod, E, exec, $fileManager"
			"$mainMod, V, togglefloating,"
			"$mainMod, SPACE, togglefloating"
			"$mainMod, R, exec, $menu"
			"$mainMod, P, pseudo," # dwindle
			"$mainMod, U, togglesplit," # dwindle
			"$mainMod, F, fullscreen,"

			# Screenshot
			", PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots"
			"shift, PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"

			# Move focus with mainMod + vim keys
			"$mainMod, h, movefocus, l"
			"$mainMod, l, movefocus, r"
			"$mainMod, k, movefocus, u"
			"$mainMod, j, movefocus, d"

			# Move windows with mainMod + Shift + vim keys
			"$mainMod SHIFT, h, movewindow, l"
			"$mainMod SHIFT, l, movewindow, r"
			"$mainMod SHIFT, k, movewindow, u"
			"$mainMod SHIFT, j, movewindow, d"


			# Alt Tab through windows
			"ALT, TAB, cyclenext"
			"ALT SHIFT, Tab, cyclenext, prev"

			# Switch workspaces with mainMod + [0-9]
			"$mainMod, 1, workspace, 1"
			"$mainMod, 2, workspace, 2"
			"$mainMod, 3, workspace, 3"
			"$mainMod, 4, workspace, 4"
			"$mainMod, 5, workspace, 5"
			"$mainMod, 6, workspace, 6"
			"$mainMod, 7, workspace, 7"
			"$mainMod, 8, workspace, 8"
			"$mainMod, 9, workspace, 9"
			"$mainMod, 0, workspace, 10"

			# Move active window to a workspace with mainMod + SHIFT + [0-9]
			"$mainMod SHIFT, 1, movetoworkspace, 1"
			"$mainMod SHIFT, 2, movetoworkspace, 2"
			"$mainMod SHIFT, 3, movetoworkspace, 3"
			"$mainMod SHIFT, 4, movetoworkspace, 4"
			"$mainMod SHIFT, 5, movetoworkspace, 5"
			"$mainMod SHIFT, 6, movetoworkspace, 6"
			"$mainMod SHIFT, 7, movetoworkspace, 7"
			"$mainMod SHIFT, 8, movetoworkspace, 8"
			"$mainMod SHIFT, 9, movetoworkspace, 9"
			"$mainMod SHIFT, 0, movetoworkspace, 10"

			# Example special workspace (scratchpad)
			"$mainMod, S, togglespecialworkspace, magic"
			"$mainMod SHIFT, S, movetoworkspace, special:magic"

			# Scroll through existing workspaces with mainMod + scroll
			"$mainMod, mouse_down, workspace, e+1"
			"$mainMod, mouse_up, workspace, e-1"

			# Media keys
			", XF86AudioPlay, exec, playerctl play-pause"
			", XF86AudioPrev, exec, playerctl previous"
			", XF86AudioNext, exec, playerctl next"
		];

		binde = [
			# Resize windows with mainMod "," "."
			"$mainMod, COMMA, resizeactive, -10 0"
			"$mainMod SHIFT, COMMA, resizeactive, 0 -10"
			"$mainMod, PERIOD, resizeactive, 10 0"
			"$mainMod SHIFT, PERIOD, resizeactive, 0 10"
		];

		bindm = [
			"$mainMod, mouse:272, movewindow"
			"$mainMod, mouse:273, resizewindow"
		];
	};
}
