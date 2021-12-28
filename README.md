# Dotfiles

This repository is a collection of my personal dotfiles. 

## Installation

### Cloning the repository

Start by cloning the repository to get the files on your machine. Alternatively, you can change `~/.dotfiles` to any location you want.

```bash
# Clone and enter the downloaded directory
git clone git@github.com:AlexisMoins/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
```

### Setup

**Note:** This repository relies on the [brew](https://brew.sh/index_fr) package manager. If you are not using this particular one, you should consider editing the `install` script to use your package manager instead of brew and install the dependencies of the `Brewfile` file. Then, getting the dotfiles to work is as easy as executing the `install` script.

```bash
# Ensure brew is working correctly
brew doctor

# Launch the script
./install
```

The `install` script will create missing directories, install dependencies and symlink the config files into your home directory using GNU stow. After the execution, you might want to force changes to take effect immediately by replacing the current shell by a new one. That can be achieved by typing :

```bash
# Config files should be loaded into the environment now!
exec ${SHELL}
```
