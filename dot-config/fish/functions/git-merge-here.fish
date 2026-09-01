function git-merge-here --argument-names source --description "Merge SOURCE into the current branch"
    if test (count $argv) -gt 1
        echo "git-merge-here: unexpected arguments"
        echo "usage: git-merge-here [SOURCE]"
        return 1
    end

    set --local target (git branch --show-current)
    if test -z "$target"
        echo "git-merge-here: not on a branch"
        return 1
    end

    set --local branches (git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/)
    set --local candidates
    for branch in $branches
        if test "$branch" != "$target"
            set --append candidates $branch
        end
    end

    if test -z "$candidates"
        echo "git-merge-here: no other local branch to merge"
        return 1
    end

    if test -z "$source"
        set source (
            printf '%s\n' $candidates \
                | gum filter --fuzzy --no-fuzzy-sort --placeholder="Merge into $target"
        )
        or return 1
    end

    if test "$source" = "$target"
        echo "git-merge-here: already on $source"
        return 1
    end

    gum confirm "Merge '$source' into '$target'?"
    or return 1

    # Fetch into FETCH_HEAD — never `origin $target:$target`, which Git refuses
    # when $target is already checked out (this worktree or another).
    git fetch origin $target
    or return

    git merge --ff-only FETCH_HEAD
    or return

    git merge $source
end
