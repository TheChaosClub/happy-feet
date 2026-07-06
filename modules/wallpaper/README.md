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