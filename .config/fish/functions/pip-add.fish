function pip-add
    pip install $argv && pip freeze > requirements.txt
end
