function dot-edit
    set --local dotfiles_dir "$HOME/.dotfiles"
    pushd "$dotfiles_dir"

    set --local file (fd --hidden --ignore . | fzf-tmux -p85%,70%)
    test -z $file && popd && return 0

    $EDITOR "$dotfiles_dir/$file"
    popd
end
