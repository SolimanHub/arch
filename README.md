# Instalación sencilla de ArchLinux

ArchLinux es una distribución muy interesante con un abanico de posibilidades muy extenso, esto es normal en todas las distribuciones de Linux, pero como Arch en su estado puro es una distro “completamente vacía” esto ofrece la facilidad de personalización como ninguna otra.

Al ser esto una ventaja, también es una desventaja para la distro misma, dado que muchos usuarios relacionan el Prompt (línea de comandos) con “difícil” cosa que es un error, si bien, esto tiene una curva de aprendizaje no lo podemos negar, pero todo tiene una curva de aprendizaje.

Uno de los principales inconvenientes de ArchLinux es que no cuenta con un instalador, lo que significa, para desgracia de muchos, que se debe usar exclusivamente la línea de comandos para realizar su respectiva instalación…

Cosa que no es difícil, pero es tediosa (al menos para mi) por lo que muchos usuarios avanzados optan por desarrollar sus propios scripts personalizados para dicha instalación, con lo que logran economizar sustancialmente el tiempo de instalación y configuración del mismo.

En este espacio se encuentra mi script de instalacion con mi configuracion personal, usted puede clonar dicho script y modificarlo a su conveniencia.

## Pasos a seguir:

Una vez que iniciado el boot de ArchLinux y se le muestra en el prompt `root@archiso ~ # _`

ejecute los siguientes comandos en el orden solicitado:

> Nota: en esta guía no explicaré para qué sirve cada comando.

- `pacman -Syy`
- `pacman -S git` ( si este le muestra error, volver a ejecutarlo)
- `git clone https://github.com/SolimanHub/arch`
- `cd arch`
- `./main` (T = este tomará tiempo)
- Se le pregunta si desea particionar el disco de forma manual, escriba 's' para si ó 'n' para no (se recomienda 'n' para maquinas virtuales)
- Se le muestran los discos disponibles, seleccione uno escribiendo el nombre especifico de la unidad `sdX` ( ejem `sda` )

    Se crearan 4 particiones raiz, home, EFI y una particion de 1M para la bios

- `./conf` (T)
- Introduzca la contraseña del usuario root
- Introduzca nombre del nuevo usuario no root
- Introduzca la contraseña del usuario no root
- `./user_conf`
- `exit`
- `exit`
- `reboot` en caso de no reiniciar, volver a ejecutar `exit` -> `reboot`

## Usar el sistema

Eso seria todo, ahora solo basta elegir usar i3 (recomendado para desarrolladores) ó xfce4 al iniciar el sistema.

Introducir su contraseña y listo ;)

Este Script facilita el proceso de instalación y puede ser utilizado sin inconveniente, pero esta incompleto, por lo cual aún puede ser difícil de manejar para algunos usuarios, esto será corregido algun dia xD

## Dudas o sugerencias 

    Telegram: @Obumbrata
