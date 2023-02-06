function git-commit
    set -l TYPE (gum choose feat fix improv refactor chore docs test)
    set -l SCOPE (gum input --placeholder scope)

    test -n $SCOPE && set -l SCOPE "($SCOPE)"

    set -l SUMMARY (gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change" --width 80)
    set -l DESCRIPTION (gum write --placeholder "Details of this change (CTRL+D to finish)")

    gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
end
