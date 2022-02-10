# Configuration for interactive shells
# Author: Alexis Moins
# Creation: 18 juin 2020

# Try to correct the spelling of command
setopt CORRECT

# Take dotfiles into account
setopt GLOBDOTS

# Enable the use of globbing patterns and expansions
setopt EXTENDEDGLOB

# Sets the cursor to the underscore shape
printf "\e[3 q"

# No highlighting when pasting text
zle_highlight=( 'paste:none' )

# Ensure the PATH contains unique entries
typeset -U PATH

# Location of the brew directory
BREW="$(brew --prefix)"

# Where to find binaries and executables
export PATH="${BREW}/bin:${HOME}/.pyenv/shims:${DOTFILES}/scripts:${PATH}"

# pyenv completion
eval "$(pyenv init -)"

# Source the configuration files of the config directory
for file in ${ZDOTDIR}/config/*(.); do
    source "${file}"; done
