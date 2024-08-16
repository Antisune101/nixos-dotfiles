{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      javascript-typescript-langserver
      nodePackages.typescript-language-server
      nodejs_20
  ];
}
