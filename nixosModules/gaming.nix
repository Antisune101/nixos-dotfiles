{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
  ];
  
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
}
