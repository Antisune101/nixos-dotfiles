{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [ hplip cups-filters ];
      browsing = true;
      browsedConf = ''
        BrowseDNSSDSubTypes _cups,_print
        BrowseLocalProtocols all
        BrowseRemoteProtocols all
        CreateIPPPrinterQueues All

        BrowseProtocols all
      '';
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
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
