alias nvimrc 'nvim $HOME/.config/nvim/init.lua'

# Copy stuff verbosely (-v) and ask for confirmation (-i)
alias cp 'cp -iv'

alias rg 'rg -i'

# Active a python virtual env
alias activate 'source (fd activate.fish .venv)'

# Rename / move stuff verbosely (-v) and ask for confirmation (-i)
alias mv 'mv -iv'

# Remove stuff verbosely (-v) and ask for confirmation (-i)
alias rm 'rm -iv'

# Perform the daily brew checkout
alias daily 'brew update; brew upgrade; brew cleanup'

# Never display colors
alias fd 'fd --color="never"'

alias mkdir 'mkdir -p'

alias ls 'exa'

alias la 'exa --all'

alias ll 'exa --long --all --git'

alias tree 'exa --tree --git-ignore'

alias ci git-commit
