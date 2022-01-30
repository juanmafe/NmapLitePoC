#!/bin/bash

# "+----------------------------------------+"
# "| EIPmap Lite Version					|"
# "| @Author: Juan Manuel Fernández Reyes	|"
# "| GPLv3.									|"
# "+----------------------------------------+"

function scan_ports() {

	for (( i=1; i<=$port_limit; i++ )); do
		(exec timeout 0.5 bash -c "</dev/tcp/$ip_domain/$i") &>/dev/null
		if [ $? -eq 0 ] ; then
			OPENPORTS[$i]=$i
		fi
	done
}

#EOF