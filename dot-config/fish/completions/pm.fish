complete -c pm -n "__fish_use_subcommand" -a "new" -f -d "Create a new empty project"
complete -c pm -n "__fish_use_subcommand" -a "clone" -f -d "Clone a remote git repository"
complete -c pm -n "__fish_use_subcommand" -a "filter" -f -d "Filter projects"
complete -c pm -n "__fish_use_subcommand" -a "list" -f -d "List projects"

#
# pm open
#
complete -c pm --condition "__fish_use_subcommand" -a "open" --no-files -d "Open a project"
complete -c pm --condition "__fish_seen_subcommand_from open; and not __fish_seen_subcommand_from (pm list)" --no-files -a "(pm list)"

complete -c pm --condition "__fish_seen_subcommand_from open" --no-files --short-option "s" --long-option "space" -d "Space where the project is located"
complete -c pm --condition "__fish_seen_subcommand_from open" --no-files --short-option "n" --long-option "name" -d "Name of the project"
complete -c pm --condition "__fish_seen_subcommand_from open" --no-files --short-option "b" --long-option "backend" -d "Name of the backend used to open projects"
complete -c pm --condition "__fish_seen_subcommand_from open" --no-files --short-option "h" --long-option "help" -d "Show this help"

#
# pm template
#
complete -c pm --condition "__fish_use_subcommand" -a "template" --no-files -d "Template related commands"

#
# pm template edit
#
complete -c pm --condition "__fish_seen_subcommand_from template; and not __fish_seen_subcommand_from edit" --no-files -a "edit" -d "Edit a template"
complete -c pm --condition "__fish_seen_subcommand_from template; and __fish_seen_subcommand_from edit" --no-files --short-option "h" --long-option "help" -d "Show this help"

#
# pm template list
#
complete -c pm --condition "__fish_seen_subcommand_from template; and not __fish_seen_subcommand_from list" --no-files -a "list" -d "List templates"
complete -c pm --condition "__fish_seen_subcommand_from template; and __fish_seen_subcommand_from list" --no-files --short-option "h" --long-option "help" -d "Show this help"

# complete -c pm --condition "__fish_seen_subcommand_from open" --no-files --short-option "s" --long-option "space" -d "Space where the project is located"
# complete -c pm --condition "__fish_seen_subcommand_from open" --no-files --short-option "n" --long-option "name" -d "Name of the project"
# complete -c pm --condition "__fish_seen_subcommand_from open" --no-files --short-option "b" --long-option "backend" -d "Name of the backend used to open projects"
# complete -c pm --condition "__fish_seen_subcommand_from open" --no-files --short-option "h" --long-option "help" -d "Show this help"
