function update-neovim
    pushd ~/neovim

    git pull && make distclean && make clean && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install

    popd
end
