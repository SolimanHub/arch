# Instalación sencilla de ArchLinux

> Nota importante: esta instalación de ArchLinux es recomendable para máquinas virtuales, dado que está configurada con BIOS, realiza un formateo total del disco, crea una sola partición ext4 (sin swap, sin home …)

ArchLinux es una distribución muy interesante con un abanico de posibilidades muy extenso, esto es normal en todas las distribuciones de Linux, pero como Arch en su estado puro es una distro “completamente vacía” esto ofrece la facilidad de personalización como ninguna otra.

Al ser esto una ventaja, también es una desventaja para la misma, dado que muchos usuarios relacionan el Prompt (línea de comandos) con “difícil” cosa que es un error, si bien, esto tiene una curva de aprendizaje no lo podemos negar, pero todo tiene una curva de aprendizaje.

Uno de los principales inconvenientes de ArchLinux es que no cuenta con un instalador, lo que significa, para desgracia de muchos, que se debe usar exclusivamente la línea de comandos para realizar su respectiva instalación…

Cosa que no es difícil, pero es tediosa (al menos para mi) por lo que muchos usuarios avanzados optan por desarrollar sus propios scripts personalizados para la instalación, con lo que logran economizar sustancialmente el tiempo de instalación y configuración del mismo.

En este espacio se encuentra mi script de instalacion con mi configuracion personal, usted puede clonar dicho script y modificarlo a su conveniencia.

## Pasos a seguir:

Una vez que ejecuto el boot de ArchLinux y se le muestra el prompt `root@archiso ~ # _`

ejecute los siguientes comandos en orden:

> Nota: en esta guía no explicaré para qué sirve cada comando.

- `pacman -Sy`
- `pacman -S git` ( si este le muestra error, volver a ejecutarlo)
- `git clone https://github.com/SolimanHub/arch`
- `cd arch`
- `./main` (T = este tomará tiempo)
- Se le muestran los discos disponibles, seleccione uno escribiendo su direccion completa (ejem `/dev/sdX`)
    Se crearan 3 particiones raiz, home y una particion de 1M para la bios
- `./conf` (T)
- Introduzca la contraseña del root
- Introduzca nombre del nuevo usuario
- Introduzca la contraseña del usuario
- reiniciar sistema desde el disco



Ahora su ArchLinux está instalado, esta configuración no es recomendable para un novato dado que tiene un gestor de ventanas, i3 para ser específico, usted puede cambiar este por un gestor de escritorio de su preferencia en el archivo llamado <u>extras</u>.

Este Script facilita el proceso de instalación y puede ser utilizado sin inconveniente, pero esta incompleto, por lo cual aún puede ser difícil de manejar para algunos usuarios, esto será corregido algun dia xD

