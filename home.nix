{ config, pkgs, ... }:
let
  modules = import ./modules/home;
in
{
  imports = with modules; [
  gnome
	kitty
	GTK
  wezterm
  helix
  git
  ];


  programs.home-manager.enable = true;

  home.username = "maxoline";
  home.homeDirectory = "/home/maxoline";

  home.packages = with pkgs; [
    blahaj
    eza
    lolcat
    figlet
    neofetch
    popcorntime
    kitty 
    wl-clipboard
    prismlauncher
    bottles
    qbittorrent
    libreoffice-still-unwrapped
    ];
      



  home.stateVersion = "24.11"; 
}

