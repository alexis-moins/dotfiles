function tmux-pm-open --description 'Interactive pm open function'
    pm list -S | gum filter --placeholder 'Select a project' --limit 1 | xargs pm open
end
