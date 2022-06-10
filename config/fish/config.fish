# Configuration of the environment
# Author Alexis Moins
# Creation: 4 June 2022

if ! status is-interactive
    # Don't go any further if this is not an interactive session
    exit
end

set -U fish_color_normal white
set -U fish_color_cwd cyan

set -U fish_color_command white
set -U fish_color_error red
set -U fish_color_cancel red
set -U fish_color_escape magenta

set -U fish_color_redirection yellow
set -U fish_color_end red
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

# Initialize the z jump command
zoxide init fish | source


# Set and export default editor globally
set --global --export EDITOR 'vim'

set --global --export VIMDOTDIR "$HOME/.vim"

set --global --export PIPENV_VENV_IN_PROJECT 1

set --global --export VIRTUAL_ENV_DISABLE_PROMPT 1


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
set __fish_git_prompt_color_upstream FF9173 yellow

set __fish_git_prompt_color_flags red
set __fish_git_prompt_color_stagedstate red

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

set --local options --cycle --multi --preview-window=border-none --marker="*"

set --local highlighting 'bg:0,bg+:0,prompt:6,border:7,pointer:1,marker:2,fg:8,fg+:3,hl:1,hl+:7,info:5'

# Default options for fzf
set --global --export FZF_DEFAULT_OPTS $options --color $highlighting

# Always use fzf-tmux if running in a tmux session
set --global --export FZF_TMUX 1

# Options passed to fzf-tmux
set --global --export FZF_TMUX_OPTS -p85%,70%

# Command executed by fzf to look for files
set --global --export FZF_DEFAULT_COMMAND fd --type f --hidden --follow

set --global --export FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Command executed by fzf to change directory
set --global --export FZF_ALT_C_COMMAND fd --type d --hidden --follow

function fzf-find-files --description 'Find files with fzf'

    set --local _file (fd --type f --hidden --follow | fzf)

    commandline --current-token --append -- $_file
    commandline --function repaint

    commandline --function end-of-line

end

bind --mode default \cy fzf-find-files

# Redefine keybindings:
# Ctrl-G to select directories
# fzf_configure_bindings --directory=\cy --history=\ch --git_status=\cs

# follow:
# exclude: exclude the given files or directories
# hidden: display hidden files as well
# set fzf_fd_opts --follow --hidden --exclude=.git --exclude=dotbot  --exclude=__pycache__ --exclude=undo-history




# }}}

# vim: syn=sh
