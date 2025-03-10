#!/bin/bash 

USER_HOME="/home/usuarioxyz"
USER_NAME="usuarioxyz"

# Configuración básica de zsh
cd "$USER_HOME"
pacman -S --noconfirm --overwrite '*'zsh zsh-completions
chsh -s "$(command -v zsh)" "$USER_NAME"
# Ejecutar comandos como usuario normal
sudo -u "$USER_NAME" zsh <<EOF
# Instalar Oh My Zsh
sh -c "\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
# Clonar plugins
git clone https://github.com/zsh-users/zsh-autosuggestions "\${ZSH_CUSTOM:-$USER_HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "\${ZSH_CUSTOM:-$USER_HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Configurar .zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "$USER_HOME/.zshrc"
EOF

echo -e "\033[32m==== YAY_INSTALL ====\033[0m"
./yay_install
