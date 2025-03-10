# ArchLinux Auto-Installer 🚀

Script de automatización para instalación de Arch Linux con configuración personalizada.  
*Simplifica el proceso de instalación y configuración en unos pocos pasos.*

---

## 📋 Requisitos Previos
- **Medio de instalación**: USB con [Arch Linux ISO](https://archlinux.org/download/).
- **Conexión a Internet**: Requerida durante la instalación.
- **Conocimientos básicos**: Particiones, BIOS/UEFI, y terminal.

---

## 🛠️ Instrucciones de Uso

### 1. Preparar el Entorno Live
1. Arranque desde el USB de Arch Linux.
2. Ejecute los siguientes comandos:

```bash
pacman -Syy                # Actualizar repositorios
pacman -S git              # Instalar Git (repetir si falla)
```
> Es posible que deba repetir este paso mas de una vez si falla la instalación de git.

### 2. Clonar el Repositorio
```bash
git clone https://github.com/SolimanHub/arch
cd arch
```

### 3. Iniciar la Instalación
```bash
./start
```

---

## 🧩 Flujo de los Scripts
El proceso se ejecuta en cascada:

1. **`datos`**  
   - Solicita: nombre de host, contraseñas, entorno gráfico y kernel.
2. **`discos_gdisk`**  
   - Crea particiones: `/`, `/home`, Swap (2 GB), EFI (550 MB).
3. **`paquetes`**  
   - Instala paquetes base y kernels.
4. **`pre-conf`**  
   - Copia archivos de configuración al sistema nuevo.
5. **`conf`**  
   - Configura zona horaria, locales y hostname.
6. **`usuarios`**  
   - Crea usuarios.
7. **`grub`**  
   - Instala GRUB.
8. **`extras`**  
   - Gestiona configuraciones críticas post-instalación, optimizando el sistema según tu hardware y preferencias..
9. **`refresh`**  
   - Retorna valores pre-instalacion de los scripts.
10. **`zsh`**  
   - Instala ZSH + plugins.
11. **`yay_install`**  
   - Configura AUR y paquetes.
12. **`limpiar`**  
   - Elimina los scripts de la instalacion.

---

## 🌟 Características Clave
- **Particionado automático**: `/`, `/home`, Swap, EFI.
- **8 entornos gráficos**: i3wm (default), GNOME, KDE, etc.
- **Drivers automáticos**: NVIDIA, AMD, Intel.
- **Post-instalación**: ZSH, YAY (AUR), temas personalizados.

---

## ⚠️ Notas
- **Para VMs**: Usar particionado automático (opción `n`).
- **Errores comunes**:
  - Si `git clone` falla: ejecutar `pacman -Syy` nuevamente.
  - Verificar conexión a internet.

---

## 🛠️ Scripts Adicionales (En Desarrollo)
| Script          | Función                             |
|-----------------|-------------------------------------|
| `gits`          | Clona configuraciones personalizadas|

---

## 📞 Soporte
- **Telegram**: [@Softliman](https://t.me/Softliman)
- **GitHub Issues**: [Reportar errores](https://github.com/SolimanHub/arch/issues)
---

