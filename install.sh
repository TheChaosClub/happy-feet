#!/bin/bash
# Happy Feet - Instalador

set -e  # Detener en caso de error

# Colores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🐧 Happy Feet - Instalador${NC}"
echo "================================"

# Verificar que estamos en el directorio correcto
if [ ! -d "core" ] || [ ! -d "modules" ]; then
    echo -e "${RED}Error: Ejecuta este script desde la raíz del proyecto${NC}"
    exit 1
fi

# Crear directorio ~/.local/bin si no existe
mkdir -p ~/.local/bin

# Función para instalar aliases
install_aliases() {
    echo -e "${YELLOW}Instalando aliases...${NC}"
    if [ -f ~/.bash_aliases ]; then
        echo -e "${YELLOW}⚠️  ~/.bash_aliases ya existe. Haciendo backup...${NC}"
        cp ~/.bash_aliases ~/.bash_aliases.bak
    fi
    cp modules/aliases/my_aliases.sh ~/.bash_aliases
    echo -e "${GREEN}✅ Aliases instalados en ~/.bash_aliases${NC}"
    echo -e "${YELLOW}Para activarlos: source ~/.bashrc o reinicia la terminal${NC}"
}

# Función para instalar wallpaper changer
install_wallpaper() {
    echo -e "${YELLOW}Instalando wallpaper changer...${NC}"
    cp modules/wallpaper/wallpaper_change.sh ~/.local/bin/
    chmod +x ~/.local/bin/wallpaper_change.sh
    echo -e "${GREEN}✅ wallpaper_change.sh instalado en ~/.local/bin/${NC}"
    echo -e "${YELLOW}Uso: wallpaper_change.sh /ruta/a/tus/wallpapers${NC}"
    
    # Verificar dependencias
    echo -e "${YELLOW}Verificando dependencias...${NC}"
    if ! command -v feh &> /dev/null && ! command -v nitrogen &> /dev/null && ! command -v gsettings &> /dev/null; then
        echo -e "${RED}⚠️  No se encontró ningún gestor de wallpapers${NC}"
        echo "Instala uno de: feh, nitrogen, o usa GNOME (gsettings ya debería estar)"
        echo -e "${YELLOW}Para Ubuntu/Debian: sudo apt install feh${NC}"
        echo -e "${YELLOW}Para Arch: sudo pacman -S feh${NC}"
    else
        echo -e "${GREEN}✅ Dependencias satisfechas${NC}"
    fi
}

# Función para instalar utilidades
install_utils() {
    echo -e "${YELLOW}Instalando utilidades compartidas...${NC}"
    mkdir -p ~/.local/lib/happy-feet/
    cp core/utils.sh ~/.local/lib/happy-feet/
    echo -e "${GREEN}✅ utils.sh instalado en ~/.local/lib/happy-feet/${NC}"
}

# Mostrar menú
echo ""
echo "¿Qué quieres instalar?"
echo "1) Solo aliases"
echo "2) Solo wallpaper changer"
echo "3) Ambos (recomendado)"
echo "4) Salir"
echo ""
read -p "Elige una opción (1-4): " option

case $option in
    1)
        install_utils
        install_aliases
        ;;
    2)
        install_utils
        install_wallpaper
        ;;
    3)
        install_utils
        install_aliases
        install_wallpaper
        ;;
    4)
        echo "Saliendo..."
        exit 0
        ;;
    *)
        echo -e "${RED}Opción inválida${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}🎉 ¡Happy Feet instalado correctamente!${NC}"
echo "🐧 Recuerda: source ~/.bashrc para activar los aliases"