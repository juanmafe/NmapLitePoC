#!/bin/bash

# "+----------------------------------------+"
# "| EIPmap Lite Version					|"
# "| @Author: Juan Manuel Fernández Reyes	|"
# "| GPLv3.									|"
# "+----------------------------------------+"

RED='\033[1;31m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NOCOLOR='\033[0m'

function print_results() {

	if [ ${#OPENPORTS[@]} -eq 0 ]; then
		echo -e "\n ${RED}[*] ${NOCOLOR}No open ports in $ip_domain"

	else
		# Color print source: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
		echo -e "\n ${YELLOW}[*] ${NOCOLOR}Port scanning on $ip_domain in process"

		for port in ${OPENPORTS[@]}; do
			echo -e "    ${GREEN}[+] $port ${NOCOLOR}-- open port"
		done
	fi
}

#EOF