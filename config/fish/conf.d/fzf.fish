# vim: syn=sh

# Command executed by fzf to look for files
set --global --export FZF_DEFAULT_COMMAND fd --type f --hidden --follow --strip-cwd-prefix

set --global --export FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# Command executed by fzf to change directory
set --global --export FZF_ALT_C_COMMAND fd --type d --hidden --follow --strip-cwd-prefix
