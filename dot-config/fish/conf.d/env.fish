#
# Variables d'environnement
#
# Ce fichier remplace les variables universelles (~/.config/fish/fish_variables).
# conf.d/ est sourcé par TOUTES les sessions fish, y compris non-interactives,
# contrairement à config.fish qui sort tôt via `status is-interactive`.
# C'est ce qui préserve la sémantique des variables universelles.
#

#
# Homebrew
#
# /opt/homebrew/bin n'est dans aucun /etc/paths* : il ne tenait auparavant
# que par la variable universelle fish_user_paths.
#
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv fish | source
end

set -gx EDITOR nvim

set -gx MANPAGER nvim "+Man!"

set -gx LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

#
# PATH
#
# `fish_add_path` ecrit par defaut dans la variable UNIVERSELLE fish_user_paths,
# qui se recree donc a chaque session. `-g` garde tout en scope global, et
# conf.d rend ces chemins disponibles aux sessions non-interactives — ce que
# fish_user_paths assurait auparavant.
#
set -gx BUN_INSTALL "$HOME/.bun"
set -gx PNPM_HOME "$HOME/.local/share/pnpm"

fish_add_path -g "$HOME/.local/bin"
fish_add_path -g /usr/local/bin
fish_add_path -g "$HOME/scripts"
fish_add_path -g "$HOME/.cargo/bin"
fish_add_path -g "$BUN_INSTALL/bin"
# pnpm >= 10 installe les binaires globaux dans $PNPM_HOME/bin
fish_add_path -g "$PNPM_HOME/bin"
