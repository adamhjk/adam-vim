install:
	git submodule init
	git submodule update
	mkdir -p ~/.vimswaps
	mkdir -p ~/.vimbackups
	mkdir -p ~/.vim/bundle
	ln -sf ~/.vim/vimrc ~/.vimrc
	vim -c 'PluginInstall' -c 'qa!'
