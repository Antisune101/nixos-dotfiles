{ ... }: {
  flake.nixosModules.orca-slicer = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [ orca-slicer ];
  };
}
