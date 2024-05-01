alias nvimrc 'nvim $HOME/.config/nvim/init.lua'

# Active a python virtual env
alias activate 'source (fd -I activate.fish)'

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

alias rg 'rg --smart-case'

alias ci git-commit

alias j 'just'

alias gc 'git-resolve-conflict'

alias psql 'docker exec -it postgres psql'

alias v nvim

alias gg "git switch (git-branch)"
