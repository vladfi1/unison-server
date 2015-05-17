#!/bin/bash

# should automate ssh stuff?

# homeshick
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
printf '\nsource "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"' >> $HOME/.bashrc

# serverip on bitbucket
homeshick clone git@bitbucket.org:vladfi1/serverip.git

# clone this repo (unison-server)
homeshick clone git@github.com:vladfi1/unison-server.git

# dotfiles
homeshick clone git@bitbucket.org:vladfi1/dotfiles.git
homeshick link dotfiles

# install unison

if [ -d /etc/apt ]; then
	INSTALL=apt-get
elif [ -d /etc/yum ]; then
	INSTALL=yum
else
	echo "Found neither apt-get nor yum."
fi

INSTALL="sudo $INSTALL -y install"
$INSTALL unison

# unison aliases
echo "alias ssh-server=$HOME/.homesick/repos/unison-server/ssh.sh" >> $HOME/.bashrc
echo "alias sync-manual=$HOME/.homesick/repos/unison-server/unison-manual.sh" >> $HOME/.bashrc
echo "alias sync-folder=$HOME/.homesick/repos/unison-server/unison.sh" >> $HOME/.bashrc
echo "alias sync-common=\"sync-folder common\"" >> $HOME/.bashrc

echo "export UNISONLOCALHOSTNAME=$USER@$HOSTNAME" >> $HOME/.bashrc

source $HOME/.bashrc
echo $UNISONLOCALHOSTNAME

