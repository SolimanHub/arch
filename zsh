#!/bin/bash 

user_home="/home/${SUDO_USER:-$USER}"

# Configuración básica de zsh
cd /home/"${SUDO_USER:-$USER}"/
pacman -S --noconfirm --overwrite '*'zsh zsh-completions
chsh -s "$(command -v zsh)" "${SUDO_USER:-$USER}"
# Ejecutar comandos como usuario normal
sudo -u "${SUDO_USER:-$USER}" zsh <<EOF
# Instalar Oh My Zsh
sh -c "\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
# Clonar plugins
git clone https://github.com/zsh-users/zsh-autosuggestions "\${ZSH_CUSTOM:-$user_home/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "\${ZSH_CUSTOM:-$user_home/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Configurar .zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "$user_home/.zshrc"
EOF

echo -e "\033[32m==== YAY_INSTALL ====\033[0m"
./yay_install
