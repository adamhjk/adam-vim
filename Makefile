install:
	git submodule update
	mkdir -p ~/.vim/bundle
	ln -sf ~/.vim/vimrc ~/.vimrc
	vim -c 'BundleInstall' -c 'qa!'
	cd ~/.vim/bundle/command-t && rake make
 
