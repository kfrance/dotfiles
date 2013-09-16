if [ -e ~/.vim ]; then
	/bin/rm -rf ~/.vim
fi
ln -s ~/dotfiles/vim ~/.vim

if [ -e ~/.vimrc ]; then
	/bin/rm ~/.vimrc
fi
ln -s ~/dotfiles/vimrc ~/.vimrc

if [ -e ~/.gvimrc ]; then
	/bin/rm ~/.gvimrc
fi
ln -s ~/dotfiles/gvimrc ~/.gvimrc

if [ -e ~/.bashrc ]; then
	/bin/rm ~/.bashrc
fi
ln -s ~/dotfiles/bashrc ~/.bashrc

if [ -e ~/.zshrc ]; then
	/bin/rm ~/.zshrc
fi
ln -s ~/dotfiles/zshrc ~/.zshrc

if [ -e ~/.ssh/config ]; then
	/bin/rm ~/.ssh/config
fi
ln -s ~/dotfiles/ssh_config ~/.ssh/config
