# Configuration of the environment
# Author Alexis Moins
# Creation: 4 June 2022
# vim: syn=sh

# Don't go any further if this is not an interactive session
not status is-interactive && exit 0

# Prepend homebrew packages to the user path
type -f --quiet brew && fish_add_path (brew --prefix)/bin

# Prepend pyenv shims directory to the user path
type -f --quiet pyenv && pyenv init - | source

# Initialize the z jump command
type -f --quiet zoxide && zoxide init fish | source

function fish_user_cursor --on-event fish_prompt
    echo -ne '\e[5 q'
end
