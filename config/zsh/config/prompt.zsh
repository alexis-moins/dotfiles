# Author: Alexis Moins
# Creation: 18 juin 2020

# Enable variable / function substitution in the prompt
setopt PROMPTSUBST

# Load the version control function
autoload vcs_info

# Execute the version control function before each prompt
precmd_functions+=( vcs_info )

# Styles used for both regular and special actions
zstyle ':vcs_info:*' formats '%F{5} on ↑ %b%u%c%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5} on %b %F{3}(%a)%f%u%c%f'

# Style used for staged and unstaged files
zstyle ':vcs_info:*' stagedstr ' %F{1}[&]%f'
zstyle ':vcs_info:*' unstagedstr ' %F{1}[!]%f'

# Single quotes are mandatory for vcs_info to be interpreted correctly
PROMPT='
%(1j.:%j .)%(#.%F{1}root %f.)%F{6}%2~%f${vcs_info_msg_0_}$(python-venv)
➜%(?..%F{1}*%f) '

# Prompt pour le corps des fonctions
PROMPT2="%F{2}... %f"

# Prompt used for command correction
SPROMPT='zsh: correct %F{1}%R%f to %F{10}%r%f [nyae] ? '
