function venv
    python -m venv $argv[1]
    and $argv[1]/bin/pip install -U pip
end
