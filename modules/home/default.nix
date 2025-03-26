{
  gnome = import ./gnome.nix;
  GTK = import ./GTK.nix;
  helix = import ./helix.nix;
  kitty = import ./kitty.nix;
  wezterm = import ./wezterm.nix;
  librewolf = import ./librewolf.nix;
  git = import ./usr-git.nix;
}
