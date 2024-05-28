{ pkgs, unstable, ... }:
{

  environment.systemPackages = with pkgs; [
    nil
    unstable.python312Packages.python-lsp-server
    marksman
    nodePackages_latest.vscode-css-languageserver-bin
    nodePackages_latest.vscode-html-languageserver-bin
    nodePackages_latest.vscode-json-languageserver-bin
    javascript-typescript-langserver
    taplo
  ];
}
