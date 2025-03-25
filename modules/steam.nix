{ config, pkgs, ... }:

{
   # Install Steam and necessary dependencies
  environment.systemPackages = with pkgs; [
     steam-run 
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports for Remote Play
    dedicatedServer.openFirewall = true; # Open ports for dedicated servers
    gamescopeSession.enable = true; # Enable Gamescope session (optional)
  };

  # Enable hardware support for gaming
  hardware.opengl = {
    enable = true;
  };

  # Optional: Enable gamemode for better gaming performance
  programs.gamemode.enable = true;

  # Optional: Enable Vulkan support
  hardware.opengl.extraPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
  ];
  hardware.opengl.extraPackages32 = with pkgs; [
    vulkan-loader
  ];
}
