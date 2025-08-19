
{ config, lib, pkgs, ... }:

{
    options = {
        vscode.enable = lib.mkEnableOption "Enables Vscode code editor";
    };

    config = lib.mkIf config.vscode.enable {
        programs.vscode = {
            enable = true;
            profiles.default.extensions = with pkgs.vscode-extensions; [
                ritwickdey.liveserver
            ];
        };
    };
}
