echo "Starting dofiles Installation..."
# echo "Switching to unstable channel..."
# sudo nix-channel --add https://channels.nixos.org/nixos-unstable nixos

# echo "Adding Home Manager Channels..."
# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

# echo "Updating Channels..."
# sudo nix-channel --update
# nix-channel --update

# echo "Installing Home Manager..."
# nix-shell '<home-manager>' -A install

echo "Switching configuration.nix file..."
if [ -f ~/.config/dotfiles/configuration.nix ]; then
  sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.bak
  sudo ln -sf ~/.config/dotfiles/configuration.nix /etc/nixos/configuration.nix
else
  echo "Error: configuration.nix not found in dotfiles"
fi

echo "Switching home.nix file..."
if [ -f ~/.config/dotfiles/home.nix ]; then
mv ~/.config/home-manager/home.nix ~/.config/home-manager/home.nix.bak
ln -sf ~/.config/dotfiles/home.nix ~/.config/home-manager/home.nix
else
  echo "Error: home.nix not found in dotfiles"
fi

echo "Installing Wallpapers..."
if [ -d ~/.config/dofiles/modules/wallpapers ]; then
  if [ ! -d ~/Pictures ]; then
    mkdir ~/Pictures
  fi
  ln -s ~/.config/dofiles/modules/wallpapers ~/Pictures/Wallpapers
else
  echo "Wallpaper folder not found in ./modules..."
fi

echo "Rebuild system..."
sudo nixos-rebuild switch
home-manager switch

echo "Installation completed succesfully. Enjoy your system :)"
echo "System will reboot in 5 seconds..."
sleep 5
reboot
