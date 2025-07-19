{ config, lib, pkgs, ... }:

{
    options = {
        printing.enable = lib.mkEnableOption "Enables printing";
    };

    config = lib.mkIf config.printing.enable {
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
    };
}
