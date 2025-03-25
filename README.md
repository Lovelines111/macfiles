**Overview**
Macfiles are dotfiles made for my ```MacBook Air 6,2```
You can however use them on other devices as well.
I tried to make them as reproducabel as possible.

**Instalation**
I recoment instaling macfiles on a freshly installed NixOS.
If you have your own configuration set up, I'd highly recomend carefully modifying
your own configuration with parts of my own, loading my entide config at once may break things.
This guide will assume you have a clean install.

1. ```nix-shell -p git file home-manager``` 

2. ```git clone https://github.com/Lovelines111/macfiles.git```

3. ```cd macfiles```

4. ```cp /etc/nixos/hardware-configuration.nix .```

5. ```chmod +x replace-user.sh```

Now we'll replace my username with your own. This is very important because if done incorrectly will prevent you from logging in.
`
6. ```./replace-user . nixoline "$(whoami)"
It should say this:
```Modifying: ./configuration.nix
Modifying: ./.git/logs/refs/heads/main
Modifying: ./.git/logs/refs/remotes/origin/HEAD
Modifying: ./.git/logs/HEAD
Modifying: ./install.sh
Modifying: ./flake.nix
Modifying: ./modules/v2rayA.nix
Modifying: ./dconf/gnome-settings.dconf
Modifying: ./dconf/openbar.conf
Modifying: ./home.nix
Replacement complete.
```

if everything is in order, proceed to the system nstalation:
```sudo nixos-rebuild switch --flake .#maxos```

Now Home manager
```home-manager switch --flake .```

And now apply gnome configuration:
```cat dconf/gnome-settings.dconf | dconf load /```

Restart the computew to apply all kernel changes.
```reboot```

/*Done!/*
