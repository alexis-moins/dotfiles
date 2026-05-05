function git-resolve-conflict
    set -l GIT_ROOT (git rev-parse --show-toplevel)

    set -l CANDIDATES (git diff --relative --name-only --diff-filter=U)
    test -z "$CANDIDATES" && echo 'No conflicts to resolve' && return 1

     echo $CANDIDATES | string split " " | xargs nvim
end
