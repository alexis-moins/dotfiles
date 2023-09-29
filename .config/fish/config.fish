# Configuration of the environment
# Author Alexis Moins
# Creation: 4 June 2022

# Don't go any further if this is not an interactive session
not status is-interactive && exit 0

# Prepend homebrew packages to the user path
type -qf brew && fish_add_path (brew --prefix)/bin

# Use sarship prompt
type -qf starship && starship init fish | source

# Prepend pyenv shims directory to the user path
type -qf pyenv && pyenv init - | source

# Initialize the z jump command
type -qf zoxide && zoxide init fish | source

function fish_user_cursor --on-event fish_prompt
    echo -ne '\e[5 q'
end

source ~/.asdf/asdf.fish

# ocaml configuration
test -d ~/.opam/opam-init/init.fish && source ~/.opam/opam-init/init.fish

echo '  ⟋|､'
echo ' (°､ ｡ 7'
echo ' |､  ~ヽ'
echo ' じしf_,)〳'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexis/google-cloud-sdk/path.fish.inc' ]; . '/Users/alexis/google-cloud-sdk/path.fish.inc'; end
