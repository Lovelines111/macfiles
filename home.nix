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
  ];


  programs.home-manager.enable = true;

  home.username = "nixoline";
  home.homeDirectory = "/home/nixoline";

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

