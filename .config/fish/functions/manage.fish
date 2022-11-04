function manage --description 'alias to use django\'s manage.py'
    set -l file (fd --strip-cwd-prefix manage.py)

    set -l cmd 'python' $file $argv

    set -q VIRTUAL_ENV
    or set -p cmd 'poetry' 'run'

    command $cmd
end
