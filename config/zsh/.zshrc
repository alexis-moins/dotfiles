# Configuration for interactive shells
# Author: Alexis Moins
# Creation: 18 juin 2020

# Try to correct the spelling of command
setopt CORRECT

# Take dotfiles into account
setopt GLOBDOTS

# Enable the use of globbing patterns and expansions
setopt EXTENDEDGLOB

# No highlighting when pasting text
zle_highlight=('paste:none')

# Beam cursor after every command
beam_cursor() {
    echo -ne '\e[5 q'
}

precmd_functions+=( beam_cursor )

# Ensure the PATH contains unique entries
typeset -U PATH

# Place where data is stored
ZDATA="${HOME}/.local/share/zsh"

# Create the directory structure if not present
[[ ! -d "${ZDATA}/cache" ]] && mkdir -p "${ZDATA}/cache"

# Location of the brew directory
BREW="/opt/homebrew"

# Where to find binaries and executables
export PATH="${BREW}/bin:${HOME}/.pyenv/shims:${HOME}/.local/bin:${DOTFILES}/scripts:${PATH}"

# pyenv completion
eval "$(pyenv init -)"

# Source the configuration files of the config directory
for file in ${ZDOTDIR}/config/*(.); do
    source "${file}"; done
