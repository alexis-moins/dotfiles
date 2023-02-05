function git-commit
    set -l type (gum choose feat fix improv refactor chore docs test)
    set -l scope (gum input --placeholder scope)

    test -n $scope && set -l scope "($scope)"

    set -l summary (gum input --value "$type$scope: " --placeholder "Summary of this change" --width 80)
    set -l description (gum write --placeholder "Details of this change (CTRL+D to finish)")

    gum confirm "Commit changes?" && git commit -m "$summary" -m "$description"
end
