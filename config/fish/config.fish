# Configuration of the environment
# Author Alexis Moins
# Creation: 4 June 2022

# Don't go any further if this is not an interactive session
not status is-interactive && exit 0

# Prepend homebrew packages to the user path
type -f --quiet brew && fish_add_path (brew --prefix)/bin

# Use starship prompt
type -f --quiet starship && starship init fish | source

# Prepend pyenv shims directory to the user path
type -f --quiet pyenv && pyenv init - | source

# Initialize the z jump command
type -f --quiet zoxide && zoxide init fish | source

function fish_user_cursor --on-event fish_prompt
    echo -ne '\e[5 q'
end

# Created by `pipx` on 2022-08-06 07:48:52
set PATH $PATH /Users/alexis/.local/bin
