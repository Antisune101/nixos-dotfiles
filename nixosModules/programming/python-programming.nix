{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python312Packages.python-lsp-server
    python3
  ];
}
