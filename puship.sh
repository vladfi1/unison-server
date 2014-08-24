#!/bin/bash
cd $HOME/.homesick/repos/serverip
git pull
curl http://ipecho.net/plain > ip.txt
git commit -am $(cat ip.txt)
git push
