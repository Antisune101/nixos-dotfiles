{ self, inputs, ... }: {
  flake.nixosModules.git = { pkgs, ... }: {
    environment.systemPackages = [ self.packages."${pkgs.stdenv.hostPlatform.system}".myGit ];
  };

  perSystem = {pkgs, ... }: {
    packages.myGit = inputs.wrapper-modules.wrappers.git.wrap {
      inherit pkgs;

      settings = {
        user = {
          name = "Antisune101";
          email = "ewanbester72@gmail.com";
        };
        init.defaultBranch = "main";
        core = {
          editor = "hx";
        };
      };
    };
  };
}
