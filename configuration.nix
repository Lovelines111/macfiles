# This is the configuration of my NixOS For MacBook Air 6,2 2013!!
# It's extra cute with some tweaks. Vesktop uses ClientTheme addon with #5e3640 color.
# Librewolf is using this theme: https://addons.mozilla.org/en-US/firefox/addon/classicpink/
# Don't forget to apply dconf from the folder nearby for gnome config and openbar config too :3

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/gnome.nix
      #./modules/vpn.nix
      ./modules/steam.nix
      ./modules/v2rayA.nix
      ./modules/networking.nix
      ./modules/mac-specifics.nix
    ];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.maxoline = {
  	isNormalUser = true;
	description = "Mac-Lin"; # Login prompt
	extraGroups = [ "networkmanager" "wheel" "audio" "video" "libvirtd" "kvm" ];
  };


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Keyboard Layouts:
  services.xserver.xkb = {
    layout = "ch, ru";
    variant = "de";
    options = "grp:win_space_toggle";
  };

  # Configure console keymap # No idea what it's for tbh
  console.keyMap = "sg";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Install firefox.
  programs.firefox.enable = false; # So long firefox reputation O7

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # I've Only added essential programs here, the rest is in home.
  environment.systemPackages = with pkgs; [
    vim
    neovim
    helix
    wget
    git
    v2raya
    v2ray
    xray
    sudo
    telegram-desktop
    vesktop
    librewolf
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
