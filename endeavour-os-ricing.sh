#!/bin/bash

echo "Installing deps/apps with Yay"

yay -S gnome-software ttf-jetbrains-mono-nerd morewaita git ripgrep curl wget unzip base-devel wl-clipboard github-cli zsh jdk8-openjdk bat gnome-tweaks apple_cursor flatpak noisetorch adw-gtk-theme wireguard-tools visual-studio-code-bin jetbrains-toolbox google-chrome discord slack-desktop extension-manager alpaca-ai cartero blackbox-terminal maven

echo "Downloading fonts"

git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git
unzip San-Francisco-Pro-Fonts-master.zip
cd San-Francisco-Pro-Fonts-master 
rm -rf README.md 
sudo mv * /usr/share/fonts

# Set fonts
gsettings set org.gnome.desktop.interface font-name 'SF Pro Rounded 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 12'

# Set rendering and antialiasing
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'medium'
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'grayscale'

# Enable minimize button and center new windows
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.mutter center-new-windows true

# Disable mouse acceleration
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'

# Add Portuguese keyboard layout
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'br')]"

# Download and set profile picture
wget -O ~/profile.jpg https://avatars.githubusercontent.com/u/53924113?v=4
sudo cp ~/profile.jpg /var/lib/AccountsService/icons/$USER
echo "[User]" | sudo tee /var/lib/AccountsService/users/$USER
echo "Icon=/var/lib/AccountsService/icons/$USER" | sudo tee -a /var/lib/AccountsService/users/$USER

# Cleanup
rm ~/profile.jpg

echo "GNOME settings have been applied successfully."

echo "Ricing made successfully!"
