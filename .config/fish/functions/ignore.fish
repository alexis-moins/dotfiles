function ignore --description 'Add items to .gitignore with ease'
    echo $argv | string split ' ' | string join \n >> (git rev-parse --show-toplevel)/.gitignore
    echo "$(count $argv) item(s) added to .gitignore"
end
