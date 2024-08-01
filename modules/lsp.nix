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
    # Go
    go
    gopls
    golangci-lint-langserver
    golangci-lint
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
    lldb
    python3
    cmake
    gcc
    # May be able to remove alsa-utils
    alsa-utils
    alsa-lib
  ];
}
