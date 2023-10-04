#!/bin/bash
set -eu
set -o pipefail

. etc/util.sh

chkroot
cls

printf "[%b*%b] Installing Bitcoin Core ... \n" $GREEN $NC

# INSTALLER CODE GOES HERE

