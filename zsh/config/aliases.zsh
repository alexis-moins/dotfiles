# Author: Alexis Moins
# Creation: 14 mars 2020

# Edit '.zshrc'
alias zshrc="vim ${ZDOTDIR}/.zshrc"

# Edit '.zshenv'
alias zshenv="vim ${DOTFILES}/zshenv"

# Edit 'vimrc'
alias vimrc="vim ${VIMDOTDIR}/vimrc"

# 
alias reload="source ${DOTFILES}/zshenv && source ${ZDOTDIR}/.zshrc"


# Display the PATH
alias path="echo '${PATH//:/\n}'"

# Met à jour homebrew et les paquets
alias daily="brew update; brew upgrade; brew cleanup"


# Copy stuff verbosely (-v) and ask for confirmation (-i)
alias cp="cp -iv"

# Rename / move stuff verbosely (-v) and ask for confirmation (-i)
alias mv="mv -iv"

# Remove stuff verbosely (-v) and ask for confirmation (-i)
alias rm="rm -iv"

alias tree='tree -I __pycache__'

alias tra='tree -a -I __pycache__ -I .git'


# Liste les éléments non cachés, avec de la couleur (G)
alias ls='ls -G'

# Liste y compris les fichiers cachés (A)
alias la='ls -A'

# Liste en format long (l), en format compréhensible (h)
alias ll='ls -Alh'

# Utilise la couleur avec grep
alias grep="grep --colour=auto"

# Attach to the last tmux session
alias ta='tmux attach-session'

# Create a new python virtual environment
alias venv='python -m venv'

# Activate an existing python virtual environment
alias activate='source **/bin/activate'

# }}}

