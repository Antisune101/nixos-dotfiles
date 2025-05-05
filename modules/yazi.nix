{ pkgs, userSettings,... }:
let 
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "main";
    hash = "sha256-XDz67eHmVM5NrnQ/uPXN/jRgmrShs80anWnHpVmbPO8";
  };
in {
  home-manager.users.${userSettings.username}.programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      sort_by = "alphabetical";
      sory_dir_first = true;
      # plugin.prepend_fetchers = [
      #   {
      #     id = "git";
      #     name = "*";
      #     run = "git";
      #   }
      #   {
      #     id = "git";
      #     name = "*/";
      #     run = "git";
      #   }
      # ];
    };

    keymap = {
      manager.prepend_keymap = [
        {
          # TODO: Make these env variables
          run = "shell 'swww img -t=none \"\$0\"'";
          on = "<C-w>";
        }
      ];
    };

    plugins = {
      full-border = "${yazi-plugins}/full-border.yazi";
      # git = "${yazi-plugins}/git.yazi";
    };

    initLua = ''
      require("full-border"):setup()
    '';
    # require("git"):setup()

  };
}
