# Configuration of the environment
# Author: Alexis Moins
# Creation: 18 juin 2020

echo "📖 Sourcing .zshenv"

# Prevents 'Terminal.app' from saving and restoring sessions
export SHELL_SESSIONS_DISABLE=1

# Prevent the python venv module from displaying virtual env in the prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Location of the dotfiles
export DOTFILES="${HOME}/.dotfiles"

# Path to the zsh config directory
export ZDOTDIR="${HOME}/.zsh"

# Path to the vim config directory
export VIMDOTDIR="${HOME}/.vim" 

# Location of the file containing the tmux session
export SESSIONFILE="${HOME}/.tmux-session"

# Options and highlighting for fzf
export FZF_DEFAULT_OPTS="--multi --height 40% --layout=reverse 
    --color 'bg:0,bg+:0,prompt:6,pointer:1,marker:1,fg:8,fg+:7,hl:2,hl+:2,info:5'"

# Command executed by fzf to look for files
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Use fzf default command with CTRL-T widget
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

 #Defines colors used by the macOS ls command (BSD)
export LSCOLORS="gxfxDxCxbxEgEdxbxgxcxd" 

# LSCOLORS equivalent used by zsh and other commands
export LS_COLORS="di=36:ln=35:ex=31:su=41:sg=46:tw=42:ow=43"
