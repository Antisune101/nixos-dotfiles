{ pkgs, userSettings,... }:
let 
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "main";
    hash = "sha256-Vvq7uau+UNcriuLE7YMK5rSOXvVaD0ElT59q+09WwdQ";
  };
in {
  home-manager.users.${userSettings.username}.programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      sort_by = "alphabetical";
      sory_dir_first = true;
    };

    plugins = {
      full-border = "${yazi-plugins}/full-border.yazi";
    };

    initLua = ''
      require("full-border"):setup()
    '';
  };
}
