function git-diff-staged
    set -l GIT_ROOT (git rev-parse --show-toplevel)

    set -l CANDIDATES (git diff --cached --name-only)
    test -z "$CANDIDATES" && echo 'No staged changes to diff' && return 1

     echo $CANDIDATES | string split " " \
        | gum filter --no-limit --fuzzy --placeholder="Select files to diff" \
        | sed -e "s!^!$GIT_ROOT/!" | xargs git diff --staged
end
