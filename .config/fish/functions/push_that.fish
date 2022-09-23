function push_that --argument-names message branch --description 'Stage all changes in the repository then commit using the given message'
    git add -A && git commit -m "$message"
    set --query branch && git push origin $branch || git push origin
end
