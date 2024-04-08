#!/usr/bin/env bash
#
#
#
match="$(zoxide query "${1}")"

if [[ -z "${match}" ]] || [[ ! -d "${match}" ]]; then
    exit 1
fi

window="$(tmux list-windows -aF "#S|#{pane_current_path}" 2> /dev/null \
    | rg -i "${match}" \
    | tr '\n' '#' \
    | cut -d '#' -f 1)"

sessionName="$(basename "${match}")"

if [[ -z "${TMUX}" ]]; then
    # Outside of tmux
    if [[ -z "${window}" ]]; then
        # Creating new session because no match
        tmux new-session -c "${match}" -s "${sessionName/\.//}"
    else
        tmux attach -t "$(echo "${window}" | cut -d "|" -f 1)"
    fi
else
    # Inside of tmux
    if [[ -z "${window}" ]]; then
        # Creating new session because no match
        sessionName="${sessionName/\.//}"

        tmux new-session -c "${match}" -d -s "${sessionName}"
        tmux switch-client -t "${sessionName}"
    else
        tmux switch-client -t "$(echo "${window}" | cut -d "|" -f 1)"
    fi
fi
