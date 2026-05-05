help:
	@echo  'usage: make <target>'
	@echo  ''
	@echo  'Stow:'
	@echo  '  stow              - Stow the dotfiles'
	@echo  '  unstow            - Unstow the dotfiles'

stow:
	stow --dotfiles --restow --no-folding .

unstow:
	stow --dotfiles --target ~ --delete .
