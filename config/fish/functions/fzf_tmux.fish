function fzf --wraps=fzf --description="Use fzf-tmux if in tmux session"
    if set --query TMUX
        fzf-tmux -p85%,70% $argv
    else
        command fzf $argv
    end
end
