{ pkgs,  ... }:
{

  environment.systemPackages = with pkgs; [
    nil
    python312Packages.python-lsp-server
    marksman
    javascript-typescript-langserver
    nodePackages.typescript-language-server
    nodejs_20
    taplo
    lldb
    python3
    cmake
    gcc
  ];
}
