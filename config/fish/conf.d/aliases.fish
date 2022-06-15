# Aliases and abbreviations
# Author: Alexis Moins
# Creation: 10 June 2022
# vim: syntax=sh

# Copy stuff verbosely (-v) and ask for confirmation (-i)
alias 'cp' 'cp -iv'

# Rename / move stuff verbosely (-v) and ask for confirmation (-i)
alias 'mv' 'mv -iv'

# Remove stuff verbosely (-v) and ask for confirmation (-i)
alias 'rm' 'rm -iv'

# Perform the daily brew checkout
alias 'daily' 'brew update; brew upgrade; brew cleanup'

# 
alias 'cat' 'bat'

alias 'fd' 'fd --color="never"'

abbr --global --add 'tt' 'tmuxinator'

#
abbr --global --add 'gs' 'git status'

abbr --global --add 'ga' 'git add'

abbr --global --add 'gA' 'git add -A'

abbr --global --add 'v' 'vim'
abbr --global --add 'nv' 'nvim'

abbr --global --add 'vu' vim -u NONE

