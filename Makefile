SCRIPTS_URL = git@github.com:alexis-moins/scripts.git
NEOVIM_URL = git@github.com:alexis-moins/nvim.git

help:
	@echo  'usage: make <target>'
	@echo  ''
	@echo  'Stow:'
	@echo  '  stow              - Stow the dotfiles'
	@echo  '  unstow            - Unstow the dotfiles'
	@echo  ''
	@echo  'Repositories:'
	@echo  '  clone-scripts     - Clone the scripts repository'
	@echo  '  clone-neovim      - Clone the neovim repository'

stow:
	stow --verbose --restow --target ~ .

unstow:
	stow --verbose --target ~ --delete .

clone-scripts:
	git clone $(SCRIPTS_URL) ~/scripts

clone-neovim:
	git clone $(NEOVIM_URL) ~/.config/nvim