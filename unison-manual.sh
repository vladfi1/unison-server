options="-ui text"
local="-root $HOME"
serverip=$(cat $HOME/.homesick/repos/serverip/ip.txt)
remote="-root ssh://$serverip"
unison ignore $options $local $remote -path $1
