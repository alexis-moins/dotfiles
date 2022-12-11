# Dotfiles

This repository is a collection of my personal dotfiles. 

## Installation

### Cloning the repository

Start by cloning the repository to get the files on your machine. Alternatively, you can change `~/.dotfiles` to any location you want.

```bash
git clone git@github.com:alexis-moins/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### Setup

**Note:** This repository relies on the [brew](https://brew.sh/index_fr) package manager. 

If you are not using brew, you should manually install the dependencies found in the [Brewfile](Brewfile). Otherwise, simply run the following commands.
```bash
brew bundle install
```

```bash
./install
```

The `install` script will create missing directories and symlink the config files into your home directory using [GNU stow](https://www.gnu.org/software/stow). After the execution, you might want to force changes to take effect immediately by replacing the current shell by a new one. That can be achieved by typing :

```bash
exec ${SHELL}
```
