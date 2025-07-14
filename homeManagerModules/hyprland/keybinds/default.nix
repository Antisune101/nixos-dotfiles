{ config, lib, ... }:

{
    imports = [
        ./globalKeybinds.nix
        ./homeRowKeybinds.nix
        #./defaultModKeybinds.nix
    ];
}
