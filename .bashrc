set -o vi

eval "$(starship init bash)"
eval "$(zoxide init bash)"

[[ -f "${HOME}/.asdf/asdf.sh" ]] && source "${HOME}/.asdf/asdf.sh"

#
# PATH
#
export PATH="${HOME}/scripts:${PATH}"
export PATH="${HOME}/.local/share/bob/nvim-bin:${PATH}"

#
# ENV VARS
#
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"

export SHELL="$(which bash)"

#
# PM
#
export PM_HOME="${HOME}/git"
export PM_INSTALL_DIR="${PM_HOME}/cli/pm"

export PM_SHOW_CMD="bat"

export PM_VITE_CMD="bun"
export PM_VITE_TEMPLATE="vue-ts"

#
# DOT
#
export DOT_INSTALL_DIR="${PM_HOME}/cli/dot"
export DOTFILES_DIR="${PM_HOME}/personal/dotfiles"

#
# RECIPE
#
export RECIPE_INSTALL_DIR="${PM_HOME}/cli/recipe"

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
alias activate="source (fd activate.fish .venv)"

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkdir="mkdir -p"

# Perform the daily brew checkout
alias daily="brew update; brew upgrade; brew cleanup"

# Never display colors
alias fd="fd --color="never""

alias ls="exa --git-ignore"
alias la="exa --all"
alias ll="exa --all --long --git"
alias tree="exa --tree --git-ignore"

alias session="nvim -S"

alias j="just"

alias psql="docker exec -it postgres psql"

alias v="nvim"

# Easier directory navigation
alias ..="cd .."
alias ...="cd .. && cd .."

#
# Functions
#
take() {
    mkdir -p "${1}" && cd "${1}"
}
