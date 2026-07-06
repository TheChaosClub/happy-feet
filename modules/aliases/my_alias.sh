#!/bin/bash
# Happy Feet - Aliases útiles para terminal

# Navegación
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'  # Para los que escriben rápido ;)

# Gestión de archivos
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# Git (si está instalado)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'

# Sistema
alias update='sudo apt update && sudo apt upgrade -y'
alias cleanup='sudo apt autoremove -y && sudo apt autoclean'
alias df='df -h'
alias du='du -h'

# Utilidades de red
alias myip='curl -s ifconfig.me'
alias ping='ping -c 5'

# Happy Feet custom
alias hf-aliases='cat ~/.bash_aliases'  # Ver tus aliases
alias hf-reload='source ~/.bashrc'      # Recargar configuración

echo "🐧 Happy Feet: Aliases cargados correctamente"