#!/bin/bash
sh ~/common/scripts/server/pullip.sh
sshfs $(cat ~/serverip/ip.txt):/ ~/server
