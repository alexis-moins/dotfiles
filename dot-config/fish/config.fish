# Don't go any further if this is not an interactive session
not status is-interactive && exit 0

# Vi key bindings (required for -M insert binds in fish_user_key_bindings)
fish_vi_key_bindings

# Use sarship prompt
type -qf starship && starship init fish | source

# Initialize the z jump command
type -qf zoxide && zoxide init fish | source

type -qf tv && tv init fish | source

fish_config theme choose "rose-pine-moon"

function setx -a name value
    set --global --export $name $value
end

#
# Homebrew
#
set --local DOT_LINUXBREW '/home/linuxbrew/.linuxbrew'
test -f $DOT_LINUXBREW/bin/brew && $DOT_LINUXBREW/bin/brew shellenv fish | source

setx XDG_CONFIG_HOME "$HOME/.config"
setx XDG_DATA_HOME "$HOME/.local/share"

#
# ENVIRONMENT
#
__gum_rose_pine

setx BUN_INSTALL "$HOME/.bun"
setx RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

fish_add_path "$BUN_INSTALL/bin"

fish_add_path "$HOME/.cargo/bin"

fish_add_path "$HOME/scripts"

fish_add_path "/usr/local/bin"
fish_add_path "$HOME/.local/bin"


#
# pnpm
#
set --export PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path "$PNPM_HOME"

#
# Aliases
#
alias g 'git'
alias b 'bat'

alias nvimrc 'nvim $HOME/.config/nvim/init.lua'

alias daily 'brew update && brew upgrade'

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

alias v nvim


#
# Abbreviations
#
abbr --add zz zellij

abbr --add tg 'tv git-branch'

abbr --add ta "tmux attach"
abbr --add tsi 'tmux-session-init'

abbr --add zd 'lazydocker'

abbr --add ss "session"

abbr --add da "direnv allow ."

abbr --add dk docker
abbr --add dsp "docker system prune --all --volumes"

#
# Git
#
abbr --add gl 'git log --all -n20'
abbr --add gm 'git-merge-here'
abbr --add gmt 'git-merge-this'

abbr --add gb 'git switch -'
abbr --add cb 'clean-branches'

abbr --add gai 'git add --interactive'
abbr --add gap 'git add --patch --interactive'


abbr --add gds 'git diff-staged'
abbr --add gdu 'git diff-unstaged'

abbr --add gc 'git switch --create'

abbr --add gA 'git add --all'

abbr --add gs 'git status --short'
abbr --add gS 'git status'

# Activate mise last to take precedence over other PATH additions
type -qf mise && mise activate fish | source
