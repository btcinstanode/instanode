#!/bin/bash
#set -eu
#set -o pipefail

. etc/util.sh

chkroot
cls

banner
sep
printf "[ %b ] INSTANODE INSTALLER \n" \\u20bf
sep

mainmenu() {
    printf "%s\n" "
MAIN MENU
1) Install Bitcoin Core.
2) Install LND (Lightning Daemon).
3) Install ElectrumX server.
Q) Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)  
        ./sbin/bitcoin-core/install.sh
        ;;
    2)
        ./sbin/lnd/install.sh
        ;; 
    3)
        ./sbin/electrumx/install.sh
        ;;             
    Q|q)
        printf "Exiting ... \n"
        exit 0
        ;;
    *)
        printf "Invalid option, quitting ... \n"
        exit 1
        ;;
    esac
}

mainmenu
