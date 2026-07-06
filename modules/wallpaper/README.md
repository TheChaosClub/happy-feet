# 🖼️ Wallpaper Update

> Un script sencillo y potente para actualizar tu fondo de pantalla con imágenes aleatorias desde la terminal

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Bash](https://img.shields.io/badge/Bash-4.0+-green.svg)](https://www.gnu.org/software/bash/)
[![ImageMagick](https://img.shields.io/badge/ImageMagick-Required-blue.svg)](https://imagemagick.org/)

## 📋 Descripción

**wallpaper_update.sh** es un script en Bash que selecciona aleatoriamente una imagen de un directorio especificado, la redimensiona y la establece como fondo de pantalla. Perfecto para:

- 🌄 Rotar fondos de pantalla automáticamente
- 🎬 Crear presentaciones de diapositivas con cron
- 🖥️ Personalizar tu entorno de trabajo
- 📁 Organizar colecciones de wallpapers por categorías

## ✨ Características

- 🎲 Selección aleatoria de imágenes
- 📐 Redimensionamiento automático con ImageMagick
- 🔍 Búsqueda por patrones (glob patterns)
- 📁 Soporte para directorios personalizados
- 🚀 Fácil integración con crontab
- 🖥️ Compatible con la mayoría de entornos Linux
- 📊 Logs informativos en tiempo real
- 🛡️ Manejo robusto de errores

## 📦 Requisitos

- **Bash** 4.0 o superior
- **ImageMagick** (para el comando `convert`)

### Instalación de ImageMagick

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install imagemagick

# Fedora/RHEL
sudo dnf install imagemagick

# Arch Linux
sudo pacman -S imagemagick

# macOS (con Homebrew)
brew install imagemagick
🚀 Instalación
Instalación rápida
bash
# Clonar el repositorio
git clone https://github.com/tu-usuario/wallpaper-update.git
cd wallpaper-update

# Hacer ejecutable el script
chmod +x wallpaper_update.sh

# Copiar a una ubicación en el PATH
cp wallpaper_update.sh ~/bin/
# o
sudo cp wallpaper_update.sh /usr/local/bin/
Instalación manual
Descarga el script

Colócalo en ~/bin/wallpaper_update.sh

Hazlo ejecutable: chmod +x ~/bin/wallpaper_update.sh

Asegura que ~/bin está en tu PATH

📖 Uso
Sintaxis básica
bash
wallpaper_update.sh [OPCIONES] [DIRECTORIO] [PATRÓN]
Modo simple (parámetros posicionales)
bash
# Usar valores por defecto
wallpaper_update.sh

# Especificar directorio (usa patrón por defecto: movie*.jpg)
wallpaper_update.sh ~/Pictures/wallpapers

# Especificar directorio y patrón
wallpaper_update.sh ~/Pictures/wallpapers "nature*.jpg"
wallpaper_update.sh ~/Fotos "wallpaper*night*.jpg"
Modo avanzado (con opciones)
bash
# Opciones completas
wallpaper_update.sh -d ~/Pictures/wallpapers -p "movie*.jpg" -o ~/fondo.jpg -r "75%"

# Redimensionar al 60%
wallpaper_update.sh -d ~/Imagenes -p "*.png" -r "60%"

# Cambiar archivo de salida
wallpaper_update.sh -d ~/Fotos -p "wallpaper*.jpg" -o ~/.background.jpg
Opciones disponibles
Opción	Descripción	Valor por defecto
-d, --dir	Directorio de búsqueda	~/Pictures/wallpaper
-p, --pattern	Patrón de archivos (glob)	movie*.jpg
-o, --output	Archivo de salida	~/.local/share/backgrounds/terminal_bg.jpg
-r, --resize	Tamaño de redimensionamiento	50%
-h, --help	Mostrar ayuda	-
🔄 Automatización con Crontab
Ejemplos de tareas programadas
cron
# Cambiar wallpaper cada hora
0 * * * * /home/tu_usuario/bin/wallpaper_update.sh

# Cambiar cada 30 minutos
*/30 * * * * /home/tu_usuario/bin/wallpaper_update.sh

# Cambiar al iniciar sesión
@reboot /home/tu_usuario/bin/wallpaper_update.sh

# Diferentes configuraciones para diferentes momentos
# Mañana - wallpapers de naturaleza
0 6 * * * /home/tu_usuario/bin/wallpaper_update.sh ~/Pictures/nature "nature*.jpg"
# Tarde - wallpapers de películas
0 14 * * * /home/tu_usuario/bin/wallpaper_update.sh ~/Pictures/movies "movie*.jpg"
# Noche - wallpapers oscuros
0 22 * * * /home/tu_usuario/bin/wallpaper_update.sh ~/Pictures/night "*night*.jpg"
Configurar crontab
bash
# Editar crontab
crontab -e

# Agregar las líneas deseadas
# Guardar y salir
💡 Ejemplos prácticos
Crear alias para diferentes colecciones
Agrega esto a tu ~/.bashrc:

bash
# Alias para diferentes colecciones de wallpapers
alias wall-movie='wallpaper_update.sh ~/Pictures/wallpapers "movie*.jpg"'
alias wall-nature='wallpaper_update.sh ~/Pictures/wallpapers "nature*.jpg"'
alias wall-anime='wallpaper_update.sh ~/Pictures/wallpapers "anime*.jpg"'
alias wall-night='wallpaper_update.sh ~/Pictures/wallpapers "*night*.jpg"'

# Función flexible
wall() {
    local dir="${1:-$HOME/Pictures/wallpapers}"
    local pattern="${2:-movie*.jpg}"
    wallpaper_update.sh "$dir" "$pattern"
}
Combinar con otros comandos
bash
# Mostrar la imagen seleccionada
wallpaper_update.sh && feh ~/.local/share/backgrounds/terminal_bg.jpg

# Crear una presentación de diapositivas
while true; do
    wallpaper_update.sh
    sleep 300  # Cambiar cada 5 minutos
done
🐛 Solución de problemas
Error: "ImageMagick no está instalado"
bash
# Instalar ImageMagick según tu distribución
sudo apt install imagemagick  # Debian/Ubuntu
sudo dnf install imagemagick  # Fedora
sudo pacman -S imagemagick    # Arch
Error: "No se encontraron archivos"
Verifica que:

El directorio existe y es accesible

El patrón coincide con archivos existentes

Tienes permisos de lectura en el directorio

bash
# Listar archivos para verificar
ls -la ~/Pictures/wallpapers/movie*.jpg
El wallpaper no se actualiza
Algunos entornos DE requieren comandos adicionales:

bash
# GNOME
gsettings set org.gnome.desktop.background picture-uri "file://$OUTPUT_FILE"

# KDE
plasma-apply-colorscheme && qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops(); for (i=0;i<allDesktops.length;i++) { d = allDesktops[i]; d.wallpaperPlugin = "org.kde.image"; d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General"); d.writeConfig("Image", "file://$OUTPUT_FILE"); }'

# XFCE
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s "$OUTPUT_FILE"
📁 Estructura de archivos
text
wallpaper-update/
├── wallpaper_update.sh    # Script principal
├── README.md              # Este archivo
├── LICENSE                # Licencia MIT
└── examples/
    ├── crontab.example    # Ejemplos de crontab
    └── bashrc.example     # Ejemplos de alias
🤝 Contribuir
¡Las contribuciones son bienvenidas!

Fork el proyecto

Crea tu rama de características (git checkout -b feature/AmazingFeature)

Commit tus cambios (git commit -m 'Add some AmazingFeature')

Push a la rama (git push origin feature/AmazingFeature)

Abre un Pull Request

📄 Licencia
Este proyecto está bajo la Licencia MIT - ver el archivo LICENSE para más detalles.

🙏 Agradecimientos
ImageMagick - Por la poderosa herramienta de manipulación de imágenes

La comunidad de Linux - Por su constante inspiración y soporte

📞 Soporte
Si encuentras algún problema o tienes sugerencias:

Abre un Issue

Envía un Pull Request

⭐ ¡No olvides darle una estrella al repositorio si te es útil! ⭐