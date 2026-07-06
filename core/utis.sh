#!/bin/bash
# Happy Feet - Utilidades compartidas
# Este archivo contiene rutas a binarios y funciones comunes

# Binarios comunes
BIN_LS="/bin/ls"
BIN_CP="/bin/cp"
BIN_MV="/bin/mv"
BIN_RM="/bin/rm"
BIN_MKDIR="/bin/mkdir"
BIN_CHMOD="/bin/chmod"
BIN_SLEEP="/bin/sleep"
BIN_DATE="/bin/date"
BIN_ECHO="/bin/echo"

# Binarios para wallpapers (se verificarán en tiempo de ejecución)
BIN_FEH="feh"
BIN_NITROGEN="nitrogen"
BIN_GSETTINGS="gsettings"

# Binarios del sistema
BIN_CURL="/usr/bin/curl"
BIN_WGET="/usr/bin/wget"
BIN_GREP="/bin/grep"
BIN_SED="/bin/sed"
BIN_AWK="/usr/bin/awk"

# Función para verificar si un binario existe
check_binary() {
    local binary="$1"
    if command -v "$binary" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Función para obtener el gestor de wallpapers disponible
get_wallpaper_manager() {
    if check_binary "$BIN_FEH"; then
        echo "feh"
    elif check_binary "$BIN_NITROGEN"; then
        echo "nitrogen"
    elif check_binary "$BIN_GSETTINGS"; then
        echo "gsettings"
    else
        echo "none"
    fi
}

# Función de logging simple
log_info() {
    echo "[INFO] $1"
}

log_error() {
    echo "[ERROR] $1" >&2
}