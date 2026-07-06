#!/bin/bash

# update_wallpaper.sh - Script para actualizar fondo de pantalla aleatoriamente

# Configuración
# WALLPAPER_DIR="$HOME/Pictures/wallpaper"
WALLPAPER_DIR="/run/media/chubasco/OS/Users/Chubasco/Pictures/Wallpaper"
OUTPUT_FILE="$HOME/.local/share/backgrounds/terminal_bg.jpg"
PATTERN="*.jpg"

# Función para obtener archivo aleatorio
get_random_file() {
    local dir="$1"
    local pattern="$2"
    
    # Usar find para mejor manejo de archivos
    local files=()
    while IFS= read -r file; do
        files+=("$file")
    done < <(find "$dir" -maxdepth 1 -type f -name "$pattern" 2>/dev/null | sort)
    
    if [ ${#files[@]} -eq 0 ]; then
        echo "Error: No se encontraron archivos en $dir con patrón $pattern" >&2
        return 1
    fi
    
    # Seleccionar aleatorio
    local random_index=$((RANDOM % ${#files[@]}))
    echo "${files[$random_index]}"
}

# Función principal
main() {
    # Crear directorio de salida si no existe
    mkdir -p "$(dirname "$OUTPUT_FILE")"
    
    # Obtener archivo aleatorio
    local selected_file=$(get_random_file "$WALLPAPER_DIR" "$PATTERN")
    
    if [ $? -ne 0 ] || [ -z "$selected_file" ]; then
        echo "Error: No se pudo seleccionar archivo" >&2
        exit 1
    fi
    
    echo "Archivo seleccionado: $selected_file"
    
    # Redimensionar y convertir
    if convert -resize 50% "$selected_file" "$OUTPUT_FILE"; then
        echo "✅ Fondo actualizado exitosamente: $OUTPUT_FILE"
    else
        echo "❌ Error al convertir la imagen" >&2
        exit 1
    fi
}

# Ejecutar
main "$@"
