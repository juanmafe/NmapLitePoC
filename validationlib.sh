#!/bin/bash

# "+----------------------------------------+"
# "| EIPmap Lite Version					|"
# "| @Author: Juan Manuel Fernández Reyes	|"
# "| GPLv3.									|"
# "+----------------------------------------+"

function validate_arguments() {

	# Validating that arguments exist.
	if [ -z $ip_domain ] || [ -z $port_limit ]; then
		echo -e "\nERROR: No arguments. Try again."
		return 1;
	fi

	validate_domain
	domain_validated=$?

	validate_port
	port_validated=$?

	if [ $domain_validated -eq 0 ] && [ $port_validated -eq 0 ]; then
		return 0;
	fi

	echo -e "\nERROR: Bad arguments. Try again."
	return 1;
}

function validate_domain() {

	# Validating first argument IP format. Regex source: https://stackoverflow.com/questions/5284147/validating-ipv4-addresses-with-regexp
	if [[ $ip_domain =~ ^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$ ]]; then
		return 0;
	fi

	# Validating first argument Domain format. Regex source: https://stackoverflow.com/questions/10306690/what-is-a-regular-expression-which-will-match-a-valid-domain-name-without-a-subd
	if [[ $ip_domain =~ ^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$ ]]; then
		return 0;
	fi

	return 1;
}

function validate_port() {

	# Validating second argument Port format. Regex source: https://stackoverflow.com/questions/12968093/regex-to-validate-port-number
	if [[ $port_limit =~ ^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$ ]]; then
		return 0;
	fi

	return 1;
}

#EOF