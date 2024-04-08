set -o vi

eval "$(starship init bash)"
eval "$(zoxide init bash)"

[[ -f "${HOME}/.asdf/asdf.sh" ]] && source "${HOME}/.asdf/asdf.sh"

#
# PATH
#
export PATH="${HOME}/scripts:${PATH}"
export PATH="${HOME}/.local/share/bob/nvim-bin:${PATH}"

export SHELL="$(which bash)"

#
# Aliases
#
alias de="dot-edit"
alias gs="git status --short"

alias ga="git-add"
alias gr="git-restore"

alias gb="git-branch"
alias gp="git push"

alias gd="git-diff"
alias gds="git-diff-staged"

alias gl="git log"
alias gg="git switch \$(git-branch)"

alias ta="tmux attach"
alias dk="docker"

alias nvimrc="nvim $HOME/.config/nvim/init.lu="

# Active a python virtual env
alias activate="source (fd activate.fish .venv)"

alias ...="cd .. && cd .."

# Copy stuff verbosely (-v) and ask for confirmation (-i)
alias cp="cp -iv"

# Rename / move stuff verbosely (-v) and ask for confirmation (-i)
alias mv="mv -iv"

# Remove stuff verbosely (-v) and ask for confirmation (-i)
alias rm="rm -iv"

# Perform the daily brew checkout
alias daily="brew update; brew upgrade; brew cleanup"

# Never display colors
alias fd="fd --color="never""

alias mkdir="mkdir -p"

alias ls="exa --git-ignore"
alias la="exa --all"
alias ll="exa --all --long --git"
alias tree="exa --tree --git-ignore"

alias session="nvim -S"

alias rg="rg --smart-case"

alias j="just"

alias psql="docker exec -it postgres psql"

alias v="nvim"

# Easier directory navigation
alias ..="cd .."
alias ...="cd ..."

#
# Functions
#
take() {
    mkdir -p "${1}" && cd "${1}"
}
