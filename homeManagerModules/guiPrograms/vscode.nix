
{ config, lib, ... }:

{
    options = {
        vscode.enable = lib.mkEnableOption "Enables Vscode code editor";
    };

    config = lib.mkIf config.vscode.enable {
        programs.vscode.enable = true;
    };
}
