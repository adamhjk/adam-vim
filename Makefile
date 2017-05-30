install:
	git submodule init
	git submodule update
	mkdir -p ~/.vimswaps
	mkdir -p ~/.vimbackups
	mkdir -p ~/.vim/bundle
	mkdir -p ~/.config
	ln -sf ~/.vim/vimrc ~/.vimrc
	ln -sf ~/.vim/vimrc ~/.vim/init.vim
	ln -sf ~/.vim ~/.config/nvim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	nvim -c 'PlugInstall' -c 'qa!'
