!/bin/bash

echo "Installing deps"

sudo apt update && sudo apt upgrade -y && sudo apt install -y git ripgrep curl wget unzip build-essential xclip gh zsh openjdk-8-jdk bat gnome-tweaks wireguard

echo "Downloading fonts"

git clone https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git
cd San-Francisco-Pro-Fonts-master 
rm -rf README.md 
sudo mv * /usr/share/fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/MPlus.zip
unzip Mplus.zip
cd Mplus
sudo mv *.ttf /usr/share/fonts

wget -O ~/profile.jpg https://avatars.githubusercontent.com/u/53924113?v=4
sudo cp ~/profile.jpg /var/lib/AccountsService/icons/$USER
echo "[User]" | sudo tee /var/lib/AccountsService/users/$USER
echo "Icon=/var/lib/AccountsService/icons/$USER" | sudo tee -a /var/lib/AccountsService/users/$USER
rm ~/profile.jpg

# Install applications
echo "Installing Flatpak applications..."

declare -A apps=(
    ["chrome"]="com.google.Chrome"
    ["discord"]="com.discordapp.Discord"
    ["cohesion"]="io.github.brunofin.Cohesion"
    ["blackbox"]="com.raggesilver.BlackBox"
    ["cartero"]="es.danirod.Cartero"
    ["slack"]="com.slack.Slack"
    ["alpaca"]="com.jeffser.Alpaca"
)

for app in "${!apps[@]}"; do
    echo "Installing $app..."
    flatpak install -y flathub "${apps[$app]}"
done

echo "All Flatpak applications installed."
