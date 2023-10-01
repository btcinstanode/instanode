#!/bin/bash

# Eyecandy #############################################
sep() {
    printf -- ' %72s\n' ' ' | tr ' ' '-'
}

# Kill installer if certain items not found ############
bail() {
	printf "\n"
	printf " If you think this is a bug, please report it to\n"
	printf " -> https://github.com/btcinstanode/instanode/issues\n"
	printf "\n"
	printf " The installer will not continue from here...\n"
	printf "\n"
	exit 1
}

# Function to check for installed commands ##############
checkutil() {
	printf '%s' " * Checking for $1..."
	if command -v "$1" >/dev/null; then
		printf "ok!\n";
		return 0;
	else
		printf "not found!\n";
		return 1;
	fi
}

# Generate ssh keypair ####################################
makekey() {
	( checkutil ssh-keygen && checkutil ssh ) || bail
	if [ ! -e "$1" ]; then
		if ! ssh-keygen -t rsa -C "$USER" -f "$1"; then
			printf " Unable to make key with that location\n"
		else
			chmod go-rw "$1"
			printf " Successfully generated key\n"
			return
		fi
	else
		if ask " Unable to generate key, do you want to delete the file?" N; then
			if ! rm "$1"; then
				printf " Unable to delete file, resetting\n"
			else
				printf " File deleted\n"
				if ! ssh-keygen -t rsa -C "$USERe" -f "$1"; then
					printf " Unable to generate key, resetting\n"
				fi
			fi
		else
			printf " Unable to make key with that path, resetting\n"
		fi
	fi
}

