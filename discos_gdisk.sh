#!/usr/bin/env bash
set -euo pipefail

echo -e "\nDiscos disponibles para trabajar:"
echo "Selecciona uno (ej: sda):"
echo

lsblk -d -o NAME,SIZE,TYPE | grep disk

echo
read -p "Disco (ej. sda): " unidad
DISCO="/dev/$unidad"

# Obtener tamaño total del disco en MB
tamanio_bytes=$(blockdev --getsize64 "$DISCO")
tamanio_mb=$((tamanio_bytes / 1024 / 1024))

# Definir tamaños fijos y calcular espacio flexible:
# 1 MB para BIOS Boot, 100 MB para EFI y 2048 MB para swap.
swap_size_mb=2048
overhead=$((1 + 100 + swap_size_mb))
flexible=$((tamanio_mb - overhead))
home_mb=$(( flexible / 2 ))  # aprox. la mitad para /home

echo "Tamaño del disco: ${tamanio_mb} MB"
echo "Tamaño para swap: ${swap_size_mb} MB"
echo "Tamaño para /home: ${home_mb} MB (aprox.)"

echo -e "\n=== Particionado con gdisk ==="
# Se crean 5 particiones:
# 1. BIOS Boot (1MB, tipo EF02)
# 2. EFI (100MB, tipo EF00)
# 3. Swap (2GB, tipo 8200)
# 4. /home (tamaño calculado, tipo 8300)
# 5. Raíz (lo que reste, tipo 8300)
gdisk "$DISCO" <<EOF
o
Y
n
1

+1M
EF02
n
2

+100M
EF00
n
3

+${swap_size_mb}M
8200
n
4

+${home_mb}M
8300
n
5


8300
w
Y
EOF

echo -e "\n=== Formateando particiones ==="
mkfs.ext4 "${DISCO}5"      # Raíz
mkfs.ext4 "${DISCO}4"      # Home
mkfs.fat -F32 "${DISCO}2"   # EFI
mkswap "${DISCO}3"         # Swap

echo -e "\n=== Montando particiones ==="
mount "${DISCO}5" /mnt
mkdir -p /mnt/home
mount "${DISCO}4" /mnt/home
mkdir -p /mnt/boot/EFI
mount "${DISCO}2" /mnt/boot/EFI

echo -e "\nActivando swap ..."
swapon "${DISCO}3"

echo -e "\nProceso finalizado."
./paquetes

