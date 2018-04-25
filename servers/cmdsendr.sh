#!/bin/bash
set -e
#
Help() {
	echo "Usage: ./cmdsendr.sh [COMMAND]"
	exit 1;
}

if [ $# -lt 1 ]
then
	Help;
fi

COMMAND=""

case "$1" in
	rh|RH|restarthttpd)
		COMMAND="sudo service httpd restart"
	;;
	wl|w)
		COMMAND="${COMMAND} wl ${2}"
	;;
	*)
		#Help;
		COMMAND="$@"
esac

for h in `cat hostnames | grep -E "^[^#]" | cut -f 2`; do
	echo "#### Executing commando on server ${h} - $(eval cat hostnames | grep ${h} | cut -f 3)";
	ssh -i keys/CHANGE_HERE.pem ec2-user@${h} "${COMMAND}";
done
