#
# Configuration de base
#
set -o vi

#
# Détection de plateforme
#
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
else
    OS="unknown"
fi

#
# Fonctions utilitaires
#
add_path() {
    # Empty directory name
    [[ -z "${1}" ]] && return 0

    # Directory does not exist
    [[ ! -d "${1}" ]] && return 0

    # Directory is already in path (check exact match to avoid false positives)
    case ":${PATH}:" in
        *:"${1}":*) return 0 ;;
    esac

    export PATH="${1}:${PATH}"
}

take() {
    mkdir -p "${1}" && cd "${1}"
}

activate() {
    local script="$(fd --no-ignore --hidden "activate$")"

    [[ -z "${script}" ]] && echo "<activate> script not found" && return 1
    source "${script}"
}

is_executable() {
    command -v "${1}" >/dev/null 2>&1
}

#
# Configuration PATH
#
# macOS specific paths
if [[ "${OS}" == "macos" ]]; then
    add_path "/opt/homebrew/bin"
fi

# Common paths
add_path "${HOME}/scripts"
add_path "${HOME}/.local/bin"
add_path "${HOME}/.bun/bin"
add_path "${HOME}/.cargo/bin"
add_path "${HOME}/.local/share/bob/nvim-bin"

#
# Variables d'environnement
#

# Colors for ls command
if [[ "${OS}" == "macos" ]]; then
    # Defines colors used by the macOS ls command (BSD)
    export LSCOLORS="gxfxDxCxbxEgEdxbxgxcxd"
fi

# LSCOLORS equivalent used by zsh and other commands
export LS_COLORS="di=36:ln=35:ex=31:su=41:sg=46:tw=42:ow=43"

# Editor
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"
export EDITOR="nvim"

# gum configuration
export GUM_FILTER_MATCH_FOREGROUND="2"
export GUM_FILTER_PROMPT_FOREGROUND="7"
export GUM_FILTER_INDICATOR_FOREGROUND="1"
export GUM_FILTER_SELECTED_PREFIX_FOREGROUND="4"
export GUM_FILTER_UNSELECTED_PREFIX_FOREGROUND="#6e738d"
export GUM_FILTER_INDICATOR=">"

export GUM_PAGER_HELP_FOREGROUND="#6e738d"
export GUM_PAGER_LINE_NUMBER_FOREGROUND="#6e738d"

export GUM_INPUT_HEADER_FOREGROUND="7"
export GUM_INPUT_PLACEHOLDER_FOREGROUND="#6e738d"
export GUM_INPUT_CURSOR_FOREGROUND="7"

export GUM_CHOOSE_HEADER_FOREGROUND="7"
export GUM_CHOOSE_SELECTED_FOREGROUND="3"
export GUM_CHOOSE_CURSOR_FOREGROUND="3"

export GUM_WRITE_HEADER_FOREGROUND="7"

# mise configuration
export MISE_USE_TOML=1

# pnpm configuration
if [[ "${OS}" == "macos" ]]; then
    export PNPM_HOME="/Users/alexis/Library/pnpm"
else
    export PNPM_HOME="${HOME}/.local/share/pnpm"
fi
case ":${PATH}:" in
    *":${PNPM_HOME}:"*) ;;
    *) export PATH="${PNPM_HOME}:${PATH}" ;;
esac

#
# Initialisation des outils
#
is_executable starship && eval "$(starship init bash)"
is_executable mise && eval "$(mise activate bash)"
is_executable opam && eval "$(opam env)"

#
# Aliases
#

# git
alias gg="git-switch-branch"
alias gc='git switch --create'
alias gs="git status --short"
alias gA="git add -A"
alias ga="git-add"
alias gr="git-restore-staged"
alias gR="git-restore"
alias gp="git push"
alias gd="git-diff"
alias gds="git-diff-staged"
alias gl="git log"

# tmux
alias ta="tmux attach"
alias tsi="tmux-session-init"

# docker
alias dk="docker"

# editor
alias nvimrc="nvim ${HOME}/.config/nvim/init.lua"
alias v='nvim'
alias session="nvim -S"

# file operations
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkdir="mkdir -p"

# brew (macOS only)
if [[ "${OS}" == "macos" ]]; then
    alias daily="brew update; brew upgrade; brew cleanup"
fi

# utilities
alias fd="fd --color=never"
alias ls="ls -G --color"
alias la="ls -A"
alias ll="ls -Alh"
alias tree="tree -a -I __pycache__ -I node_modules -I .git -I .venv"

# database
alias psql="docker exec -it postgres psql"

# directory navigation
alias ..="cd .."
alias ...="cd .. && cd .."

# custom scripts
alias de="dot-edit"
alias se="script-edit"

# pnpm
export PNPM_HOME="/home/alexis/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
