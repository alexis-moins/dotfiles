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
change_cursor_shape() {
    printf "\e[3 q"
}

# Executes the change_cursor_shape function before each prompt
precmd_functions=( change_cursor_shape )

# pyenv completion
eval "$(pyenv init -)"

# Ensure the PATH contains unique entries
typeset -U PATH

# Source the configuration files of the config directory
for file in ${ZDOTDIR}/config/*(^D); do
    source "${file}"; done
