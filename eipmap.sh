#!/bin/bash

# "+----------------------------------------+"
# "| EIPmap Lite Version					|"
# "| @Author: Juan Manuel Fernández Reyes	|"
# "| GPLv3.									|"
# "+----------------------------------------+"

# Imports
source ./validationlib.sh
source ./scanlib.sh
source ./savelib.sh
source ./printlib.sh

# Global
declare -a OPENPORTS
validIP=1

echo -e "EIPmap developed by Juan Manuel Fernandez Reyes."
echo -e "Exec time: $(date)"

until [ $validIP == 0 ]; do
	echo -e "\nEnter an IP/Domain to scan:"
	read ip_domain

	echo -e "\nEnter a port limit to scan:"
	read port_limit

	validate_arguments $ip_domain $port_limit
	validIP=$?
done

scan_ports
print_results
save_csv

#EOF