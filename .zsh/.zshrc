# Configuration for interactive shells
# Author: Alexis Moins
# Creation: 18 juin 2020

echo '📖 Sourcing .zshrc'

# Try to correct the spelling of command
setopt CORRECT

# Take dotfiles into account
setopt GLOBDOTS

# Enable the use of globbing patterns and expansions
setopt EXTENDEDGLOB

# Sets the cursor to the underscore shape
printf "\e[3 q"

# Ensure the PATH contains unique entries
typeset -U PATH

# Where to find binaries and executables
export PATH="/opt/homebrew/bin:${HOME}/.pyenv/shims:${DOTFILES}/scripts:${PATH}"

# pyenv completion
eval "$(pyenv init -)"

# Source the configuration files of the config directory
for file in ${ZDOTDIR}/config/*(.); do
    source "${file}"; done

