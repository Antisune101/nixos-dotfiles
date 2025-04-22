{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [
    superhtml
    typescript-language-server
    vscode-langservers-extracted
  ];
}
