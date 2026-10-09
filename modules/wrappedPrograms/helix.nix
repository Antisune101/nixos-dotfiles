{ self, inputs, ... }: {
  flake.nixosModules.helix = { pkgs, ...}: {
    environment.systemPackages = [
      self.packages."${pkgs.stdenv.hostPlatform.system}".myHelix
    ];
  };

  perSystem = { pkgs, ... }: {
    packages.myHelix = inputs.wrapper-modules.wrappers.helix.wrap {
      inherit pkgs;
      settings = {
        editor = {
          cursor-shape = {
            insert = "bar";
            normal ="block";
            select = "underline";
          };
          line-number = "relative";

        };
      };
    };
  };
}
