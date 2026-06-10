help:
	@echo  'usage: make <target>'
	@echo  ''
	@echo  'Stow:'
	@echo  '  stow              - Stow the dotfiles'
	@echo  '  unstow            - Unstow the dotfiles'

stow:
	stow --dotfiles --adopt --restow .

unstow:
	stow --dotfiles --target ~ --delete .

check:
	brew bundle check --global

dump:
	brew bundle dump --describe --global --no-vscode --force

install:
	brew bundle install --global
