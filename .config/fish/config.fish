# Don't go any further if this is not an interactive session
not status is-interactive && exit 0

# Prepend homebrew packages to the user path
type -qf brew && fish_add_path (brew --prefix)/bin

# Use sarship prompt
type -qf starship && starship init fish | source

# Initialize the z jump command
type -qf zoxide && zoxide init fish | source

function fish_user_cursor --on-event fish_prompt
    echo -ne '\e[5 q'
end

test -f ~/.asdf/asdf.fish && source ~/.asdf/asdf.fish

# ocaml configuration
test -f ~/.opam/opam-init/init.fish && source ~/.opam/opam-init/init.fish

# echo '  ⟋|､'
# echo ' (°､ ｡ 7'
# echo ' |､  ~ヽ'
# echo ' じしf_,)〳'

# bun
set --export BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.local/share/bob/nvim-bin"

fish_add_path "$HOME/scripts"
fish_add_path "$HOME/.local/bin"

set --export PM_INSTALL_DIR "$HOME/dev/personal/pm"
set --export PM_SHOW_CMD "bat"

set --export DOT_INSTALL_DIR "$HOME/dev/personal/dot"
set --export RECIPE_INSTALL_DIR "$HOME/dev/personal/recipe"
