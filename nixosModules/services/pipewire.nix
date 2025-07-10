{config, lib, ...}: {
  options = {
    pipewire.enable = lib.mkEnableOption "Enables pipewire audio service";
  };

  config = lib.mkIf config.pipewire.enable {
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
  };
}
