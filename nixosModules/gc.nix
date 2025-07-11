{ ... }:

{
    nix = {
        optimise = {
            automatic = true;
            dates = "weekly";
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
    };
}
