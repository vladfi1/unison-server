#!/bin/bash
cd $HOME/.homesick/repos/serverip
curl http://ipecho.net/plain > ip.txt
git commit -am "$(<ip.txt)"
