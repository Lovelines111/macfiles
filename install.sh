#bash!
 
#fix for hardware
cp /etc/nixos/hardware-configuration.nix .

#fix up the user names in configuration and flake
replace_user_in_configuration() {
    local current_user
    current_user=$(whoami)
    sed -i "s|users.users.nixoline|users.users.${current_user}|g" ./configuration.nix
    sed -i "s|homeConfigurations.\"nixoline\"|homeConfigurations.\"${current_user}\"|g" ./flake.nix
}

#the instalation itself
sudo nixos-rebuils boot --flake .#maxos
nix-shell -p home-manager
home-manager switch --flake .
cat ./dconf/gnome-settings.dconf | dconf load /

echo "All set and ready to go!"
read -p "Do you want to reboot now to apply the configuration? (y/n): " response

if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Rebooting now..."
    sudo reboot
else
    echo "*Cancelled*"
    echo "Alrigh, but reboot it adviced because we just changed kernel"
    echo "Be very careful with rebuilds now!"
fi
