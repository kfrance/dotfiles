# Setup symbolic links
if [ -e ~/.config/nvim/vim ]; then
	/bin/rm -rf ~/.config/nvim
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
if [ -e ~/.bash_profile ]; then
	/bin/rm ~/.bash_profile
fi
if [ -e ~/.git-prompt.sh ]; then
	/bin/rm ~/.git-prompt.sh
fi

#ln -s $HOME/dotfiles/vim $HOME/.vim
ln -s $HOME/dotfiles/vim $HOME/.config/nvim
ln -s $HOME/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/gvimrc $HOME/.gvimrc
ln -s $HOME/dotfiles/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/git-prompt.sh $HOME/.git-prompt.sh

if [[ ! -d "/usr/share/nvim/site/pack/packer" ]] || [[ ! -d "$HOME/.local/share/nvim/site/pack/packer" ]]; then
	echo "Packer not installed. See https://github.com/wbthomason/packer.nvim"
fi
