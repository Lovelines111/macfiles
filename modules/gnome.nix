# modules/gnome.nix
{ config, pkgs, lib, ... }:

let
  dconfFile = ../dconf/gnome-settings.dconf;
in
{
  imports = [];
  
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

  #keyboard lights
  systemd.services.keyboard-backlight = {
    description = "Set Mac keyboard backlight";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo 255 > /sys/class/leds/smc::kbd_backlight/brightness'";
      Type = "oneshot";
    };
  };

}


