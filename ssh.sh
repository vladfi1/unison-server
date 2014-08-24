#!/bin/bash
sh $HOME/.homesick/repos/unison-server/pullip.sh
ssh $(cat $HOME/.homesick/repos/serverip/ip.txt)
