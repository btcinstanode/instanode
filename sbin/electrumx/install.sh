#!/bin/bash
set -eu
set -o pipefail

. etc/util.sh

chkroot
cls

printf "[%b*%b] Installing ElectrumX server ... \n" $GREEN $NC

# INSTALLER CODE GOES HERE

