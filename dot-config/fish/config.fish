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
# Sur macOS /home est un automount autofs : le moindre stat y coûte ~20 ms.
# conf.d/env.fish a déjà mis en place /opt/homebrew le cas échéant, donc on ne
# sonde linuxbrew que si aucun brew n'a été trouvé.
if not command -q brew
    set --local DOT_LINUXBREW '/home/linuxbrew/.linuxbrew'
    test -f $DOT_LINUXBREW/bin/brew && $DOT_LINUXBREW/bin/brew shellenv fish | source
end

setx XDG_CONFIG_HOME "$HOME/.config"
setx XDG_DATA_HOME "$HOME/.local/share"

#
# Prompt (ex-variables universelles)
#
set -g fish_greeting ''
set -g fish_prompt_pwd_dir_length 0

#
# ENVIRONMENT
#
__gum_rose_pine

setx RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"

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
abbr --add gl 'git log -n20'
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

# mise est déjà activé par son conf.d, ce qui le rend disponible aux shells
# non-interactifs (config.fish, lui, sort tôt via `status is-interactive`).
# On ne refait donc que le recalcul d'environnement, pour que ses chemins
# repassent devant les fish_add_path ci-dessus, plutôt qu'un second
# `mise activate` complet.
functions -q __mise_env_eval && __mise_env_eval
