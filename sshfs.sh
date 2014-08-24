#!/bin/bash
sh $HOME/.homesick/repos/unison-server/pullip.sh
sshfs $(cat $HOME/.homesick/repos/serverip/ip.txt):/ ~/server
