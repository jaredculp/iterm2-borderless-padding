all:
	if [ ! -d "iTerm2" ]; then git clone https://github.com/gnachman/iTerm2; fi
	cd iTerm2; git reset --hard; git pull; git apply ../0001-Remove-borders-add-padding.patch; make
