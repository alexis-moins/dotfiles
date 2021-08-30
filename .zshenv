# Author: Alexis Moins
# Creation: 18 juin 2020

# Prevents `Terminal.app` from saving and restoring sessions
SHELL_SESSIONS_DISABLE=1

# Path to the zsh config directory
export ZDOTDIR="${HOME}/.zsh"

# Path to the vim config directory
export VIMDOTDIR="${HOME}/.vim" 

# Sets vim as the default editor
export EDITOR="vim"              

# Uses vim as the default man pager
export MANPAGER="vim -M +MANPAGER -"

# Defines colors used by the macOS ls command (BSD)
export LSCOLORS="gxfxDxCxbxEgEdxbxgxcxd" 

# LSCOLORS equivalent used by zsh and other commands
export LS_COLORS="di=36:ln=35:ex=31:su=41:sg=46:tw=42:ow=43"
