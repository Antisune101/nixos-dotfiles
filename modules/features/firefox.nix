{ inputs, ... }: {
  flake.nixosModules.firefox = { ... }: {
    programs.firefox = {
      enable = true;
      preferences = {
        "widget.gtk.libadwaita-colors.enabled" = false;
      };
    };
  };
}
