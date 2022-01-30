#!/bin/bash

# "+----------------------------------------+"
# "| EIPmap Lite Version					|"
# "| @Author: Juan Manuel Fernández Reyes	|"
# "| GPLv3.									|"
# "+----------------------------------------+"

function save_csv() {

	#Cleaning preview search.
	> $ip_domain.csv

	for port in ${OPENPORTS[@]}; do
		echo "$ip_domain;$port;open" >> $ip_domain.csv
	done

	echo -e
}

#EOF