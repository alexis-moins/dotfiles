function git-merge-this --argument-names target --description "Merge the current branch into TARGET"
    if test -z "$target"
        echo "git-merge-this: expected a target branch name"
        echo "usage: git-merge-this TARGET"
        return 1
    end

    set --local current (git branch --show-current)
    if test -z "$current"
        echo "git-merge-this: not on a branch"
        return 1
    end

    if test "$current" = "$target"
        echo "git-merge-this: already on $target"
        return 1
    end

    git fetch origin $target
    or return

    git switch $target
    or return

    git merge --ff-only FETCH_HEAD
    or return

    git merge $current
end
