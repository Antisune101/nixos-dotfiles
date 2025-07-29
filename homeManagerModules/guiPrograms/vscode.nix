
{ config, lib, pkgs, ... }:

{
    options = {
        vscode.enable = lib.mkEnableOption "Enables Vscode code editor";
    };

    config = lib.mkIf config.vscode.enable {
        programs.vscode = {
            enable = true;
            extensions = with pkgs.vscode-extensions; [
                ritwickdey.liveserver
            ];
        };
    };
}
