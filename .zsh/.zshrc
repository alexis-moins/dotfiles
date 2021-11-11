# Configuration for interactive shells
# Author: Alexis Moins
# Creation: 18 juin 2020

# Try to correct the spelling of command
setopt correct

# Take dotfiles into account
setopt globdots

# Enable the use of globbing patterns and expansions
setopt extendedglob

# Ensure the following variables contain unique entries
typeset -U PATH path FPATH fpath

# Add the homebrew bin directory to the path
path=( "/opt/homebrew/bin" ${path} "${HOME}/.scripts" )

# Add the directory containing functions to import with autoload to 'fpath'
fpath+=( "${ZDOTDIR}/autoload" )

# Sets the cursor to the underscore shape
change_cursor_shape() {
    printf "\e[3 q"
}

# Executes the change_cursor_shape function before each prompt
precmd_functions=( change_cursor_shape )

# Source all configuration files of the 'config' directory
autoload init-env && init-env

# Initialize the completions system without producing a dump file (-D)
autoload -U compinit && compinit -D
