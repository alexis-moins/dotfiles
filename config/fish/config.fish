# Configuration of the environment
# Author Alexis Moins
# Creation: 4 June 2022

if not status is-interactive
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
set --global --export EDITOR 'nvim'

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


function fish_title
    echo ''
end

function fish_user_cursor --on-event fish_prompt
    echo -ne '\e[5 q'
end

# vim: syn=sh
