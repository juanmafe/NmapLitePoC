#!/bin/bash

# "+----------------------------------------+"
# "| EIPmap Lite Version					|"
# "| @Author: Juan Manuel Fernández Reyes	|"
# "| GPLv3.									|"
# "+----------------------------------------+"

YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NOCOLOR='\033[0m'

function print_results() {

	# Color print source: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
	echo -e "\n ${YELLOW}[*] ${NOCOLOR}Ports scanning about $ip_domain in process"

	for port in ${OPENPORTS[@]}; do
		echo -e "    ${GREEN}[+] $port ${NOCOLOR}-- open port"
	done
}

#EOF