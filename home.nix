{ pkgs, userSettings, homeModules, ... }: {
    home = {
        username = "${userSettings.username}";
        homeDirectory = "${userSettings.homeDir}";
        stateVersion = "24.05";
    };
    imports = homeModules;


    programs = {
        home-manager.enable = true;
    };    

    gtk.iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
    };
}
