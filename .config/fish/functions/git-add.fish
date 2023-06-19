function git-add --description "Add files to git interactively"
    set -l GIT_ROOT (git rev-parse --show-toplevel)

    set -l CANDIDATES (git ls-files -mo --exclude-standard --full-name)
    test -z "$CANDIDATES" && echo 'No more changes to stage.' && return 0

    echo $CANDIDATES | string split " " \
        | gum filter --no-limit --fuzzy --placeholder="File(s) to stage..." \
        | sed -e "s!^!$GIT_ROOT/!" | xargs git add
end
