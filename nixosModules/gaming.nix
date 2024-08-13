{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    r2modman
    heroic
  ];
  
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
}
