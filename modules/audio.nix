{ pkgs, ... }:

{
	services.pipewire = {
		enable = true;
		alsa = {
			enable = true;
			support32Bit = true;
		};
		wireplumber.enable = true;
		pulse.enable = true;
		jack.enable = true;
	};

	

	environment.systemPackages = with pkgs; [
		wireplumber
		pavucontrol
	];
}
