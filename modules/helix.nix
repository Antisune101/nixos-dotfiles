{ pkgs, lib, userSettings, ... }:

{
  environment.systemPackages = with pkgs; [ nil nixd ];
  home-manager.users.${userSettings.username}.programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
      
    };
    
  };
  
}
