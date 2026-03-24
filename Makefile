help:
	@echo  'usage: make <target>'
	@echo  ''
	@echo  'Stow:'
	@echo  '  stow              - Stow the dotfiles'
	@echo  '  unstow            - Unstow the dotfiles'

stow:
	stow --restow --no-folding --target ~ .

unstow:
	stow --target ~ --delete .
