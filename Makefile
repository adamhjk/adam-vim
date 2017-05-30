install:
	git submodule init
	git submodule update
	mkdir -p ~/.vimswaps
	mkdir -p ~/.vimbackups
	mkdir -p ~/.vim/bundle
	ln -sf ~/.vim/vimrc ~/.vimrc
	ln -sf ~/.vim/vimrc ~/.vim/init.vim

	vim -c 'PlugInstall' -c 'qa!'
