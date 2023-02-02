function git-commit
    set -l type (gum choose feat fix improv refactor chore docs test)

    set -l scope (gum input --placeholder scope)
end
