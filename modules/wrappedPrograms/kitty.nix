{ self, inputs, ... }: {
  flake.nixosModules.kitty = { pkgs, ...}: {
    environment.systemPackages = [
      self.packages."${pkgs.stdenv.hostPlatform.system}".myKitty
    ];
  };

  perSystem = { pkgs, ... }: {
    packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;
      settings = {
        enable_audio_bell = "no";
        cursor_trial = 3;
        shell_integration = "enabled";
      };
    };
  };
}

