{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  # hardware.printers = {
  #   ensurePrinters = [{
  #     name = "Ek_print_nice";
  #     location = "office";
  #     deviceUri = "ppi://192.168.18.43/ipp";
  #     model = "everywhere";
  #   }];
  # };
}
