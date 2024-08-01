{ config, pkgs, ... }:

let 
  dotfileDir = "/home/antisune/.config/dotfiles";
  myEditor = "hx --config ~/.config/helix/config.toml";
  myShellAliases = {
    dots = "cd ~/.config/dotfiles";
    conf = "sudo ${myEditor} ~/.config/dotfiles/configuration.nix";
    home = "${myEditor} ~/.config/dotfiles/home-managerModules/home.nix";
    flake = "${myEditor} ~/.config/dotfiles/flake.nix";
    reshome = "home-manager switch";
    resnix = "sudo nixos-rebuild switch --flake ${dotfileDir}";
  };
in {

  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./rofi.nix
    ./lf.nix
    ./system-theme.nix
    ./git.nix
  ];

  home.username = "antisune";
  home.homeDirectory = "/home/antisune";

  home.stateVersion = "23.11";



  # home.pointerCursor = {
  #   gtk.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Classic";
  #   size = 12;
  # };


  

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

  
  programs = {
    kitty = {
      enable = true;
      # theme = "Gruvbox Dark Hard";
      # font.name = "DejavuSansM Nerd Font Mono";
      extraConfig = ''
        confirm_os_window_close 0
        background_opacity 0.8
      '';
    };

    zsh =  {
      enable = true;
      dotDir = ".config/zsh";
      shellAliases = myShellAliases;

      enableCompletion = true;
      syntaxHighlighting.enable = true;
      # The spaces in 'PS1 = ""' cost me the better part of a day
      initExtra = ''
        PS1="%F{red}[%F{yellow}%n%F{green}@%F{blue}%m %F{magenta}%~%F{red}]%F{white}$ "
      '';
    };

    helix = {
      enable = true;
      settings.theme = "gruvbox_dark_hard";
    };


    bat = {
      enable = true;
      config = {
    #     theme = "gruvbox-dark";
      };
    };

    btop = {
      enable = true;
      settings = {
        # color_theme = "gruvbox_dark";
        vim_keys = true;
      };
    };

  };

  home.sessionVariables = {
    EDITOR = myEditor;
    BROWSER = "brave";
    PAGER = "bat";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
