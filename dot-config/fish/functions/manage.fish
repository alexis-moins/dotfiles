function manage --description 'alias to use django\'s manage.py'
    set -l file (fd --strip-cwd-prefix manage.py)

    # TODO: check if $file is empty
    command 'python' $file $argvend
end
