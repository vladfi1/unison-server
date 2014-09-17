cd $HOME/.homesick/repos/serverip
git pull

options="-ui text"
local="-root $HOME"
serverip=$(cat ip.txt)
remote="-root ssh://$serverip"
unison ignore $options $local $remote -path $1
