#!/bin/bash

# should automate ssh stuff?

# homeshick
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

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

echo $(hostname) > $HOME/.unison/LOCALHOSTNAME

source $HOME/.bashrc
echo $UNISONLOCALHOSTNAME

