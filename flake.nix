{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        inputs.stylix.nixosModules.stylix
        ./configuration.nix
      ];  


    };
    devShells.${system}.default = pkgs.mkShell rec {
      name = "Programming :)";
      nativeBuildInputs = [
        pkgs.pkg-config
      ];
      buildInputs = with pkgs; [
        udev
        alsa-lib
        vulkan-loader
        xorg.libX11
        xorg.libXcursor
        xorg.libXi
        xorg.libXrandr
        libxkbcommon
        wayland
      ];

      shellHook = ''
        zsh
      '';
      LD_LIBRARY_PATH = nixpkgs.lib.makeLibraryPath buildInputs;
    };
  };
  
}
