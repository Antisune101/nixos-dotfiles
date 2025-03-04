{ pkgs, lib, userSettings, ... }:

{
  home-manager.users.${userSettings.username}.programs.helix = {
    enable = true;
    settings = {
      theme = lib.mkDefault "dark_plus";
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
