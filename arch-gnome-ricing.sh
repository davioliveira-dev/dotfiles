#!/bin/bash

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
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'pt')]"

# Set window switch shortcut to Alt-Tab
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"

# Download and set profile picture
wget -O ~/profile.jpg https://avatars.githubusercontent.com/u/53924113?v=4
sudo cp ~/profile.jpg /var/lib/AccountsService/icons/$USER
echo "[User]" | sudo tee /var/lib/AccountsService/users/$USER
echo "Icon=/var/lib/AccountsService/icons/$USER" | sudo tee -a /var/lib/AccountsService/users/$USER

# Cleanup
rm ~/profile.jpg

echo "GNOME settings have been applied successfully."

# Install applications
echo "Installing Flatpak applications..."

declare -A apps=(
    ["chrome"]="com.google.Chrome"
    ["discord"]="com.discordapp.Discord"
    ["cohesion"]="io.github.cohesionapp.Cohesion"
    ["blackbox"]="com.blackbox.Blackbox"
    ["cartero"]="org.cartero.Cartero"
    ["slack"]="com.slack.Slack"
    ["alpaca"]="com.alpaca.Alpaca"
    ["vscode"]="com.visualstudio.code"
    ["zed"]="com.zed.Zed"
    ["extension-manager"]="com.example.ExtensionManager"  # Replace with correct ID if known
)

for app in "${!apps[@]}"; do
    echo "Installing $app..."
    flatpak install -y flathub "${apps[$app]}"
done

echo "All Flatpak applications installed."
