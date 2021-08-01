# Configuration for interactive shells
# Author: Alexis Moins
# Creation: 18 juin 2020

# Tries to correct the spelling of command
setopt correct

# Takes dotfiles into account
setopt globdots

# Enables the use of globbing patterns and expansions
setopt extendedglob

# Ensures the following variables contains unique entries
typeset -U PATH path FPATH fpath

# Adds the pyenv shims directory and the homebrew bin directory to the path
path=( "${HOME}/.pyenv/shims" "/opt/homebrew/bin" ${path} )

# Adds the directory containing functions to import with autoload to 'fpath'
fpath+=( "${ZDOTDIR}/autoload" )

# Enable completion for pyenv
eval "$(pyenv init -)"

# Adds the help aliases to look for zsh builtins in the zsh documentation
autoload init-help && init-help

# Sources all configuration files of the 'config' directory
autoload source-config && source-config

# Initializes the completions system without producing a dump file (-D)
autoload -U compinit && compinit -D
