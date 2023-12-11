function tmux-pm-open --description 'Interactive pm open function'
    pm list | gum filter --placeholder 'Select a project' --limit 1 | xargs pm open -S
end
