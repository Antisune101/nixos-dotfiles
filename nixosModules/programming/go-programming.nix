{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        go
        gopls
        golangci-lint-langserver
        golangci-lint
    ];
}
