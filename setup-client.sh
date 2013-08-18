#!/bin/bash

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

#export UNISONLOCALHOSTNAME=$USER@$HOSTNAME
#echo $UNISONLOCALHOSTNAME

cd $HOME

# make unison profile

if [ ! -d .unison ]; then
	mkdir .unison
fi

cat <<EOF > .unison/ignore
ignore = Name *~
ignore = Name .~*

ignore = Name *.o
ignore = Name *.pyc
ignore = Name *.class

ignore = Name .dropbox*
ignore = Path .SyncTrash/*
EOF

echo ignore > .unison/ignore.prf

# serverip on bitbucket
# should automate ssh stuff?
git clone git@bitbucket.org:vladfi1/serverip.git

# setup crontab
prevtab=$(crontab -l)


(crontab -l; cat common/scripts/server/clienttab.txt) | crontab -
