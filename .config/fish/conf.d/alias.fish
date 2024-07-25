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

alias ci git-commit

alias j 'just'

alias psql 'docker exec -it postgres psql'

# alias v nvim

#
# git
#
alias gw "git-switch-branch"
alias gc 'git switch --create'

alias gs="git status --short"

alias gA="git add -A"
alias ga="git-add"

alias gr="git-restore-staged"
alias gR="git-restore"

alias gp="git push"

alias gd="git-diff"
alias gds="git-diff-staged"

alias gl="git log"
