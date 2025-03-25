{ config, pkgs, inputs, ... }:

# Cool themes here:
#https://github.com/atelierbram/Base2Tone-kitty/blob/main/themes/
#https://github.com/dexpota/kitty-themes/blob/master/themes/
#https://github.com/PandaCatPlayz/kitty-themes/blob/master/themes/

let
  # Define the theme URL. Use raw url e.g. "https://raw.githubusercontent.com/path/theme.conf"
  URL = "https://raw.githubusercontent.com/PandaCatPlayz/kitty-themes/refs/heads/master/themes/Sakura_Night.conf";

  # Epic automation! don't touch it though
  THEME = pkgs.stdenv.mkDerivation {
    name = "kitty-theme.conf";
    src = builtins.fetchurl {
      url = URL;
      sha256 = "sha256:0503dxcwfcnlb95rilbc628a99ab197rqwba51vs6gw2xhibx71n";
    };
    phases = [ "install" ];
    install = ''
      cp $src $out
    '';
  };
in

{

# Configure kitty terminal
	programs.kitty = {
		enable = true;
		#Font settings:
		font = {
		name = "FiraCode Nerd Font";
		size = 12;
			};

		settings = {
			include = "${THEME}";
			background_opacity = 0.8;
			background_blur = 1;
			dynamic_background_opacity = true;
		};
		keybindings = {
			"alt+e" = "next_tab";
			"alt+q" = "previous_tab";
		};
	};
}
