function git-restore --description "Restore git files interactively"
    set -l GIT_ROOT (git rev-parse --show-toplevel)

     git diff --cached --name-only \
        | gum filter --no-limit --fuzzy --placeholder="File(s) to restore..." \
        | sed -e "s!^!$GIT_ROOT/!" | xargs git restore --staged
end
