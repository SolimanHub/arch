#!/bin/bash 

# Configuración básica de zsh
cd /opt/
pacman -S --noconfirm --overwrite '*' git zsh zsh-completions
echo "1"
chsh -s $(which zsh) "${SUDO_USER:-$USER}"
echo "2"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "3"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "4"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "5"
sed -i 's/^plugins=.*$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' /home/${SUDO_USER:-$USER}/.zshrc
echo "6"
./limpiar
