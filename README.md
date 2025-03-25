# Overview

Macfiles are dotfiles made for my `MacBook Air 6,2`.  
You can however use them on other devices as well.  
I tried to make them as reproducible as possible.

# Installation

I recommend installing macfiles on a freshly installed NixOS.  
If you have your own configuration set up, I'd highly recommend carefully modifying your own configuration with parts of my own. Loading my entire config at once may break things.  
This guide will assume you have a clean install.

1. Install necessary tools:

    ```bash
    nix-shell -p git file home-manager
    ```

2. Clone the repository:

    ```bash
    git clone https://github.com/Lovelines111/macfiles.git
    ```

3. Navigate to the cloned directory:

    ```bash
    cd macfiles
    ```

4. Copy the hardware configuration:

    ```bash
    cp /etc/nixos/hardware-configuration.nix .
    ```

5. Make the script executable:

    ```bash
    chmod +x replace-user.sh
    ```

Now we'll replace my username with your own. This is very important because if done incorrectly, it will prevent you from logging in.

6. Run the replacement script:

    ```bash
    ./replace-user . nixoline "$(whoami)"
    ```

It should output something like this:

    ```
    Modifying: ./configuration.nix
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

If everything is in order, proceed to the system installation:

7. Rebuild your system:

    ```bash
    sudo nixos-rebuild switch --flake .#maxos
    ```

8. Run Home Manager:

    ```bash
    home-manager switch --flake .
    ```

9. Apply the GNOME configuration:

    ```bash
    cat dconf/gnome-settings.dconf | dconf load /
    ```

10. Restart the computer to apply all kernel changes:

    ```bash
    reboot
    ```

---

//*Done!*//

---

Now the commands are neatly formatted as code blocks. Let me know if you need anything else!
