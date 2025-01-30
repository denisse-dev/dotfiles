# Update will only update the directory the repo is in 
# unless you add the install option too

update:
	@git pull origin

install:
	@cp .spacemacs .xbindkeysrc .xinitrc .zprofile .zshenv .zshrc ~/
	@cp -a -r .config/. ~/.config
