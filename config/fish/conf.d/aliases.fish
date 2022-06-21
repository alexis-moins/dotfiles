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

# Never display colors
alias 'fd' 'fd --color="never"'
