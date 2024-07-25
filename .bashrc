set -o vi

eval "$(starship init bash)"
eval "$(zoxide init bash)"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

#
# Functions
#
add_path() {
    # Empty directory name
    [[ -z "${1}" ]] && return 0

    # Directory does not exist
    [[ ! -d "${1}" ]] && return 0

    # Directory is already in path
    [[ "${PATH}" == *"${1}"* ]] && return 0

    echo "add ${1} to PATH"
    export PATH="${1}:${PATH}"
}

take() {
    mkdir -p "${1}" && cd "${1}"
}

activate() {
    source "$(fd --no-ignore --hidden "activate$")"
}

#
# PATH
#
add_path "/opt/homebrew/bin"

add_path "${HOME}/.local"
add_path "${HOME}/.local/share/bob/nvim-bin"

add_path "${HOME}/scripts"

#
# ENVIRONMENT
#
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"

export SHELL="$(which bash)"

#
# gum
#
export GUM_FILTER_MATCH_FOREGROUND="2"
export GUM_FILTER_PROMPT_FOREGROUND="7"
export GUM_FILTER_INDICATOR_FOREGROUND="1"

export GUM_FILTER_SELECTED_PREFIX_FOREGROUND="4"
export GUM_FILTER_UNSELECTED_PREFIX_FOREGROUND="#6e738d"

export GUM_FILTER_INDICATOR=">"

#
# pm
#
export PM_HOME="${HOME}/git"
export PM_SHOW_CMD="bat"

export PM_VITE_CMD="bun"
export PM_VITE_TEMPLATE="vue-ts"

#
# mise
#
export MISE_USE_TOML=1

#
# Aliases
#
alias gs="git status --short"

alias gA="git add -A"
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

alias nvimrc="nvim ${HOME}/.config/nvim/init.lua"

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

alias mkdir="mkdir -p"

# Perform the daily brew checkout
alias daily="brew update; brew upgrade; brew cleanup"

# Never display colors
alias fd="fd --color="never""

alias ls="eza --git-ignore"
alias la="eza --all"
alias ll="eza --all --long --git"
alias tree="eza --tree --git-ignore"

alias session="nvim -S"

alias j="just"

alias psql="docker exec -it postgres psql"

# Easier directory navigation
alias ..="cd .."
alias ...="cd .. && cd .."

# Use mise shims without adding them to the path
#
# For instance:
#   x python  <=> mise exec -- python
#   x node@18 <=> mise exec -- node@18
alias x="mise exec --"

eval "$(~/.local/bin/mise activate bash)"
