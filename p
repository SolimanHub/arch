#!/usr/bin/bash

echo "Discos disponibles para trabajar"
echo "Seleccionar uno: /dev/sdX"
echo 
echo

fdisk -l | grep Dis | cut -d "," -f1
echo
# en unidad se debe escribir el nombre y direccion del disco "/dev/sdX
read unidad

tamanio=$(fdisk -l | grep $unidad | grep bytes | cut -d ',' -f 3 | cut -d ' ' -f 2)

home=$((tamanio/2))
echo "tamaño origen $tamanio"
echo "tamaño al 50% $home"
