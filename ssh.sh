#!/bin/bash
sh ~/common/scripts/server/pullip.sh
ssh $(cat ~/serverip/ip.txt)
