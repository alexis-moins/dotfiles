# vim: syn=sh

set --local options --cycle --multi --preview-window=border-none --marker="*" # TODO add binding to open in $EDITOR

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
