options="-ui text"
local="-root $HOME"
serverip=$(cat $HOME/serverip/ip.txt)
remote="-root ssh://$serverip"
unison ignore $options $local $remote -path $1
