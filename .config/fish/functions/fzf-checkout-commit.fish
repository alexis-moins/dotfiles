function fzf-checkout-commit
    git ls | fzf --bind="ctrl-s:execute(git checkout {1})+abort" | awk '{print $1}' | xargs git show --patience
end
