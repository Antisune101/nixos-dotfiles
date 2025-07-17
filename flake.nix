{
  description = "Nixos Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland";

    hyprland-plugins = {
        url = "github:hyprwm/hyprland-plugins";
        inputs.hyprland.follows = "hyprland";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
        url = "github:danth/stylix";
        inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; config.allowUnfreePredicate = _: true; };
    lib = nixpkgs.lib;

    userSettings = {
      username = "antisune";
    };
  in
  {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        specialArgs = { inherit inputs; inherit system; inherit userSettings; };
        modules = [
          ./hosts/desktop/configuration.nix
          ./nixosModules
          ];
      };

      surface = lib.nixosSystem {
        specialArgs = {inherit inputs; inherit system; inherit userSettings; };
        modules = [
          ./hosts/surface/configuration.nix
          ./nixosModules
        ];
      };

    };

    homeManagerModules.default = ./homeManagerModules;
  };
}
