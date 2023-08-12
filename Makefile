.DEFAULT_GOAL := bootstrap

install:
	@echo " ====== Checking dependencies ====== "

bootstrap:
	@stow zsh
	@stow asdf
	@stow tmux
	@stow config
	@stow aliases
