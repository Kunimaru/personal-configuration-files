# Add user to sudoers
# su root -c "/sbin/adduser $USER sudo && pkill -u $USER"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Download personal-configuration-files
cd ~
wget -nc https://raw.githubusercontent.com/Kunimaru/personal-configuration-files/refs/heads/master/.zshrc
wget -nc https://raw.githubusercontent.com/Kunimaru/personal-configuration-files/refs/heads/master/.vimrc

# Add "contrib" and "non-free" to /etc/apt/sources.list
sudo vi -N /etc/apt/sources.list

# Install aptitude packages
sudo apt update
sudo apt install -y curl docker fonts-liberation git gnome-shell-extension-dashtodock gnome-shell-extension-gpaste ibus-mozc pulseaudio ufw xsel zsh

# Set zsh as default
sudo chsh -s /bin/zsh $USER

# Setup Git
git config --global push.default current

# Generate SSH for Github
ssh-keygen -t ed25519

# Setup input method
im-config
ibus-setup

echo '- Install these packages manually.'

# Install Bedtime Mode
echo 'Bedtime Mode: https://www.google.com/search?q=gnome+bedtime+mode'
firefox-esr --new-tab 'https://www.google.com/search?q=gnome+bedtime+mode'

# Install Google Chrome
echo 'Google Chrome: https://www.google.com/search?q=google+chrome'
firefox-esr --new-tab 'https://www.google.com/search?q=google+chrome'

# Install Visual Studio Code
echo 'Visual Studio Code: https://www.google.com/search?q=vscode'
firefox-esr --new-tab 'https://www.google.com/search?q=vscode'

read -p 'press enter to reboot...' TMP
sudo reboot
