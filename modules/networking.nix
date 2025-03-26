{pkgs, ... }:
{
  networking = {
  hostName = "maxos";
  wireless.enable = false;
  networkmanager.enable = true;
  networkmanager.dns = "none";
  nameservers = [ "9.9.9.9" "9.9.9.11" ]; #DNS
  dhcpcd.extraConfig = "nohook resolv.conf";
  };
  
  services.resolved.enable = false;

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
   networking.firewall.allowedTCPPorts = [ 22 10808 ];
   networking.firewall.allowedUDPPorts = [ 22 10808 ];
   networking.firewall.trustedInterfaces = [ "tun0" ]; #allow vpn connection. I don't know what ports it's using so I had to go with the device.
   networking.firewall.enable = true;

}
