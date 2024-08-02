{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Nix language server
    nil
    # Markdown language server
    marksman
    # TOML toolkit
    taplo
    taplo-lsp
    # Debugger thing
    lldb
    # IDK if I still need this. I think it was for a rust error?
    cmake
    gcc
    # Git
    git
  ];
 
   
}
