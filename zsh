#!/bin/bash 

# Configuración básica de zsh
cd /opt/
pacman -S --noconfirm --overwrite '*' git zsh zsh-completions
chsh -s $(which zsh) "${SUDO_USER:-$USER}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/^plugins=.*$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' /home/${SUDO_USER:-$USER}/.zshrc
cd /
./extras
