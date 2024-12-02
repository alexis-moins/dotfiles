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

# # ocaml configuration
# test -f ~/.opam/opam-init/init.fish && source ~/.opam/opam-init/init.fish

#
# ENVIRONMENT
#
set -gx GUM_FILTER_MATCH_FOREGROUND  "2"
set -gx GUM_FILTER_PROMPT_FOREGROUND "7"
set -gx GUM_FILTER_INDICATOR_FOREGROUND "1"

set -gx GUM_FILTER_SELECTED_PREFIX_FOREGROUND "4"
set -gx GUM_FILTER_UNSELECTED_PREFIX_FOREGROUND "#6e738d"

set -gx GUM_FILTER_INDICATOR ">"

# bun
set --export BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.local/share/bob/nvim-bin"

fish_add_path "$HOME/scripts"

fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.local/bin/bruce"

set --export RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

#
# pm
#
set --export PM_HOME "$HOME/git"
set --export PM_SHOW_CMD "bat"

set --export PM_VITE_CMD "bun"
set --export PM_VITE_TEMPLATE "vue-ts"

$HOME/.local/bin/mise activate fish | source

#
# Aliases
#
alias dev 'npm run dev'
alias nvimrc 'nvim $HOME/.config/nvim/init.lua'

# Active a python virtual env
alias activate 'source (fd --no-ignore --hidden activate.fish)'

alias ... 'cd .. && cd ..'

# Copy stuff verbosely (-v) and ask for confirmation (-i)
alias cp 'cp -iv'

# Rename / move stuff verbosely (-v) and ask for confirmation (-i)
alias mv 'mv -iv'

# Remove stuff verbosely (-v) and ask for confirmation (-i)
alias rm 'rm -iv'

# Perform the daily brew checkout
alias daily 'brew update; brew upgrade; brew cleanup'

# Never display colors
alias fd 'fd --color="never"'

alias mkdir 'mkdir -p'

alias ls 'eza --git-ignore'

alias la 'eza --all'

alias ll 'eza --all --long --git'

alias tree 'eza --tree --git-ignore'

alias session 'nvim -S'

alias j 'just'

alias v nvim

#
# Abbreviations
#
abbr --add ta "tmux attach"
abbr --add tsi 'tmux-session-init'

abbr --add ss "session"

abbr --add da "direnv allow ."

abbr --add dk docker
abbr --add dsp "docker system prune --all --volumes"

# git
abbr --add gb 'git switch -'
abbr --add cb 'clean-branches'

abbr --add sw 'git switch'

abbr --add se 'script-edit'
abbr --add de 'dot-edit'
