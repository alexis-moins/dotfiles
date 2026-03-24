# Don't go any further if this is not an interactive session
not status is-interactive && exit 0

# Use sarship prompt
type -qf starship && starship init fish | source

# Initialize the z jump command
type -qf zoxide && zoxide init fish | source

# Initialize mise env
type -qf mise && mise env | source

type -qf tv && tv init fish | source

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

fish_add_path "/usr/local/bin"
fish_add_path "$HOME/.local/bin"

set --export RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

#
# pnpm
#
set --export PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path "$PNPM_HOME"

#
# pm
#
set --export PM_HOME "$HOME/git"
set --export PM_SHOW_CMD "bat"

set --export PM_VITE_CMD "bun"
set --export PM_VITE_TEMPLATE "vue-ts"

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

abbr --add tg 'tv git-branch'

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
