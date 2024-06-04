{ pkgs,  ... }:
{

  environment.systemPackages = with pkgs; [
    nil
    python312Packages.python-lsp-server
    marksman
    nodePackages_latest.vscode-css-languageserver-bin
    nodePackages_latest.vscode-html-languageserver-bin
    nodePackages_latest.vscode-json-languageserver-bin
    javascript-typescript-langserver
    taplo
  ];
}
