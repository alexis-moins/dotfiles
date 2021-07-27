# Configuration for interactive shells
# Author: Alexis Moins
# Creation: 18 juin 2020

# Tries to correct the spelling of command
setopt correct

# Takes dotfiles into account
setopt globdots

# Enables the use of globbing patterns and expansions
setopt extendedglob

# Prepends homebrew's bin and pyenv's bin directories to the path
# export PATH="/opt/homebrew/bin:${PYENV_ROOT}/bin:$PATH"

# Adds the scripts directory to 'path'
path=( "${HOME}/.pyenv/shims" "/opt/homebrew/bin" ${path} )

# Adds the directory containing functions to import with autoload to 'fpath'
# Might want to add '/opt/homebrew/share/zsh/site-functions' to fpath
fpath+=( "${ZDOTDIR}/autoload" )

# Ensures the following variables contains unique entries
typeset -U PATH path FPATH fpath

# Enable completion for pyenv
eval "$(pyenv init -)"

# Loads the completion function as well as the config loader
autoload -U compinit source-config

# Sources all configuration files of the 'pack' directory
source-config

# Adds the help aliases to look for zsh builtins in the zsh documentation
autoload init-help && init-help

# Initializes the completions system without producing a dump file (-D)
compinit -D
