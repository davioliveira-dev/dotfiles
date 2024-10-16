#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "🏗️ Installing dependencies and applications with Yay..."

# Install applications using Yay
yay -S --noconfirm gnome-software \
    ttf-jetbrains-mono-nerd \
    morewaita \
    git \
    ripgrep \
    curl \
    wget \
    unzip \
    base-devel \
    github-cli \
    fish \
    bat \
    gnome-tweaks \
    apple_cursor \
    flatpak \
    noisetorch \
    adw-gtk-theme \
    visual-studio-code-bin \
    google-chrome \
    steam \
    gnome-backgrounds \
    gnome-remote-desktop \
    heroic-games-launcher

echo "📥 Downloading fonts..."
git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git
cd San-Francisco-Pro-Fonts 

# Remove unnecessary files and move fonts to system directory
rm -rf README.md 
sudo mv * /usr/share/fonts

# Set the font preferences
echo "🖋️ Setting font preferences..."
gsettings set org.gnome.desktop.interface font-name 'SF Pro Rounded 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 12'

# Configure window management settings
echo "🔧 Configuring window settings..."
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'
gsettings set org.gnome.mutter center-new-windows true

# Disable mouse acceleration
echo "🐭 Disabling mouse acceleration..."
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'

# Add Portuguese keyboard layout
echo "🇧🇷 Adding Portuguese keyboard layout..."
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'br')]"

# Download and set profile picture
echo "🖼️ Downloading and setting profile picture..."
wget -O ~/profile.jpg https://avatars.githubusercontent.com/u/53924113?v=4
sudo cp ~/profile.jpg /var/lib/AccountsService/icons/$USER

# Create user account service configuration
{
    echo "[User]"
    echo "Icon=/var/lib/AccountsService/icons/$USER"
} | sudo tee /var/lib/AccountsService/users/$USER > /dev/null

# Clean up downloaded profile picture
rm ~/profile.jpg

echo "🎉 Ricing completed successfully!"
