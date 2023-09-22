function git-diff --description="Interactive git diff"
    set -l GIT_ROOT (git rev-parse --show-toplevel)

    set -l CANDIDATES (git ls-files -mo --exclude-standard --full-name)
    test -z "$CANDIDATES" && echo 'No changes to diff' && return 1

    echo $CANDIDATES | string split " " \
        | gum filter --no-limit --fuzzy --placeholder="Select files to diff" \
        | sed -e "s!^!$GIT_ROOT/!" | xargs git diff
end
