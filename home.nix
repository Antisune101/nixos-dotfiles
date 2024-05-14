{ config, pkgs, ... }:

let 
  home = builtins.getEnv "HOME";
  dotfileDir = "${home}/.config/dotfiles";
  myEditor = "hx --config ~/.config/helix/config.toml";
  myShellAliases = {
    dots = "cd ~/.config/dotfiles";
    home = "${myEditor} ~/.config/dotfiles/home.nix";
    conf = "sudo ${myEditor} ~/.config/dotfiles/configuration.nix";
    reshome = "home-manager switch";
    resnix = "sudo nixos-rebuild switch";
  };
in {

  imports = [
    "${dotfileDir}/modules/hyprland.nix"
    "${dotfileDir}/modules/waybar.nix"
    "${dotfileDir}/modules/lf.nix"
  ];

  home.username = "antisune";
  home.homeDirectory = "/home/antisune";

  home.stateVersion = "23.11";



  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 12;
  };


  nixpkgs.config.allowUnfree = true;
  
  home.packages = with pkgs; [
    brave
    vesktop
    godot_4
    gimp
    obsidian

  ];

  xdg.mime.enable = true;

  xdg.mimeApps =
  let
    imageViewer = "nsxiv.desktop";
    myApps = {
      "image/jpg" = imageViewer;
      "image/jpeg" = imageViewer;
      "image/png" = imageViewer;
      "image/svg" = imageViewer;
    };
   in {
    enable = true;
    associations.added = myApps;
    defaultApplications = myApps;
  };

  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark Hard";
    font.name = "DejavuSansM Nerd Font Mono";
    extraConfig = ''
      confirm_os_window_close 0
      background_opacity 0.8
    '';
  };


  programs.bash = {
    enable = true;
    shellAliases = myShellAliases;
  };

  programs.zsh =  {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = myShellAliases;

    enableCompletion = true;
    syntaxHighlighting.enable = true;
    # The spaces in 'PS1 = ""' cost me the better part of a day
    initExtra = ''
      PS1="%F{yellow}[ %n ]%F{white}@%F{yellow}[ %~ ]%F{white}$ "
    '';
  };

  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark-hard";
    extraConfig = {
      show-icons = true;
      display-drun = "Applications";
      drun-display-format = "{name}";
    };
  };

  programs.helix = {
    enable = true;
    settings.theme = "gruvbox_dark_hard";
  };

  programs.git = {
    enable = true;
    userName = "Antisune101";
    userEmail = "ewanbester72@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name =  "Papirus";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
  };


  home.sessionVariables = {
    EDITOR = myEditor;
    BROWSER = "brave";
    PAGER = "bat";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
