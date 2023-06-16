function git-add --description "Add files to git interactively"
    set -l GIT_ROOT (git rev-parse --show-toplevel)

    git ls-files -mo --exclude-standard --full-name $GIT_ROOT \
        | gum filter --no-limit --fuzzy --placeholder="File(s) to stage..." \
        | sed -e "s!^!$GIT_ROOT/!" | xargs git add
end
