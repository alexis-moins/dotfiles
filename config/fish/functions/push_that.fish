function push_that --description 'Stage all changes in the repository then commit using the given message'
    git add -A && git commit -m "$argv" && git push
end
