# Configuration of the environment
# Author Alexis Moins
# Creation: 4 June 2022
# vim: syn=shell

if ! status is-interactive
    # Don't go any further if this is not an interactive session
    exit
end

set -U fish_color_normal white
set -U fish_color_cwd cyan

set -U fish_color_command white
set -U fish_color_error FF6578
set -U fish_color_cancel FF6578
set -U fish_color_escape magenta

set -U fish_color_redirection yellow
set -U fish_color_end FF6578
set -U fish_color_operator magenta

set -U fish_color_quote blue

set -U fish_color_param white
set -U fish_color_valid_path $fish_color_param

set -U fish_color_comment brblack
set -U fish_color_autosuggestion brblack

set -U fish_pager_color_progress magenta
set -U fish_pager_color_selected_prefix white
set -U fish_pager_color_selected_completion white
set -U fish_pager_color_selected_description green
set -U fish_pager_color_selected_background black

set -U fish_pager_color_secondary_prefix brblack
set -U fish_pager_color_secondary_completion brblack
set -U fish_pager_color_secondary_description brblack
set -U fish_pager_color_secondary_background black

set -U fish_pager_color_prefix brblack
set -U fish_pager_color_completion brblack
set -U fish_pager_color_description brblack
set -U fish_pager_color_background black

set -U fish_color_search_match green

# In case I ever use fish_cwd
set fish_prompt_pwd_dir_length 0

#
set --global --export PYENV_ROOT $HOME/.pyenv

# Prepend pyenv shims directory to the PATH
pyenv init - | source


# Set and export default editor globally
set --global --export EDITOR 'vim'

set --global --export VIMDOTDIR "$HOME/.vim"

set --global --export PIPENV_VENV_IN_PROJECT 1

set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1

# Copy stuff verbosely (-v) and ask for confirmation (-i)
abbr --global --add 'cp' 'cp -iv'

# Rename / move stuff verbosely (-v) and ask for confirmation (-i)
abbr --global --add 'mv' 'mv -iv'

# Remove stuff verbosely (-v) and ask for confirmation (-i)
abbr --global --add 'rm' 'rm -iv'

abbr --global --add 'gs' 'git status'

abbr --global --add 'ga' 'git add'

abbr --global --add 'gaa' 'git add -A'

# Perform the daily brew checkout
alias 'daily' 'brew update; brew upgrade; brew cleanup'

alias 'cat' 'bat'

# {{{ git

set __fish_git_prompt_show_informative_status

set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_stashstate '$'
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_invalidstate '#'
set __fish_git_prompt_char_cleanstate ''

set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_describe_style branch

set __fish_git_prompt_showcolorhints

set __fish_git_prompt_color white
set __fish_git_prompt_color_branch magenta
set __fish_git_prompt_color_upstream FF9173 bryellow

set __fish_git_prompt_color_flags FF6578
set __fish_git_prompt_color_stagedstate FF6578

# }}}

# Bind ^Z to
bind \cz fg\r

function fish_title
    echo ''
end

function fish_user_cursor --on-event fish_postexec
    echo -ne '\e[5 q'
end

# {{{ fzf

set --local highlighting 'bg:0,bg+:0,prompt:6,border:7,pointer:1,marker:1,fg:#464A72,fg+:7,hl:2,hl+:2,info:5'
set --local options '--cycle --multi --height 40% --layout=reverse --preview-window=border-none --marker="*"'

set --global --export FZF_DEFAULT_OPTS "$options --color $highlighting"

# Redefine keybindings:
# Ctrl-G to select directories
fzf_configure_bindings --directory=\cy --history=\ch --git_status=\cs

# type: type of the filtered elements (f for files)
# follow:
# exclude: exclude the given files or directories
# hidden: display hidden files as well
set fzf_fd_opts --type f --follow --hidden --exclude=.git --exclude=dotbot  --exclude=__pycache__

function fzf --wraps=fzf --description="Use fzf-tmux if in tmux session"
  if set --query TMUX
    fzf-tmux -p85%,70% $argv
  else
    command fzf $argv
  end
end


# }}}
