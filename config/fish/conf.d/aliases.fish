# Aliases and abbreviations
# Author: Alexis Moins
# Creation: 10 June 2022

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

#
abbr --global --add 'gs' 'git status'

abbr --global --add 'ga' 'git add'

abbr --global --add 'gA' 'git add -A'

abbr --global --add 'v' 'vim'

abbr --global --add 'vu' vim -u NONE

# vim: syntax=sh
