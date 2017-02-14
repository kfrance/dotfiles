# Setup symbolic links
if [ -e ~/.vim ]; then
	/bin/rm -rf ~/.vim
fi
if [ -e ~/.vimrc ]; then
	/bin/rm ~/.vimrc
fi
if [ -e ~/.gvimrc ]; then
	/bin/rm ~/.gvimrc
fi
if [ -e ~/.bashrc ]; then
	/bin/rm ~/.bashrc
fi
if [ -e ~/.zshrc ]; then
	/bin/rm ~/.zshrc
fi
if [ -e ~/.ssh/config ]; then
	/bin/rm ~/.ssh/config
fi
if [ -e ~/.bash_profile ]; then
	/bin/rm ~/.bash_profile
fi
cd ~

ln -s dotfiles/vim .vim

ln -s dotfiles/vimrc .vimrc

ln -s dotfiles/gvimrc .gvimrc

ln -s dotfiles/bashrc .bashrc

ln -s dotfiles/zshrc .zshrc

ln -s dotfiles/ssh_config .ssh/config

ln -s dotfiles/bash_profile .bash_profile

chmod 644 ~/dotfiles/ssh_config
