function update-neovim
    set -l project (pm filter neovim --path)

    test -z $project && return 1
    pushd $project

    git pull
    and make distclean
    and make clean
    and make CMAKE_BUILD_TYPE=RelWithDebInfo
    and sudo make install

    popd
end
