{pkgs, ... }:
{
  hardware.cpu.intel.updateMicrocode = true;
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "ondemand"; # or "powersave"
  services.xserver.videoDrivers = [ "modesetting" ];

  #Camear support
  hardware.facetimehd.enable = true;

}
