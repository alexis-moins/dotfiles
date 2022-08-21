function take --description 'Creates a directory then cd into it' --argument directory
    mkdir -p $directory && cd $directory
end
