cd /home/vlad/serverip
curl http://ipecho.net/plain > ip.txt
git commit -am "$(<ip.txt)"
