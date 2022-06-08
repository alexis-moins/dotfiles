function fish_prompt --description="Display the prompt selected by the user"

    set_color $fish_color_cwd cyan
    printf '\n%s' (prompt_pwd)

    set_color magenta
    printf '%s' (fish_vcs_prompt)

    if set --query VIRTUAL_ENV
        set_color brblack
        printf ' using 📦 %s' (python --version | string lower)
    end

    set_color normal
    printf '\n➜ '

end
