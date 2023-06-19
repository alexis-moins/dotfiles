function git-restore --description "Restore git files interactively"
    set -l GIT_ROOT (git rev-parse --show-toplevel)

    set -l CANDIDATES (git diff --cached --name-only)
    test -z "$CANDIDATES" && echo 'No more staged changes to restore.' && return 0

     echo $CANDIDATES | string split " " \
        | gum filter --no-limit --fuzzy --placeholder="File(s) to restore..." \
        | sed -e "s!^!$GIT_ROOT/!" | xargs git restore --staged
end
