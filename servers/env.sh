#!/bin/bash

# Show a little help to the user, and exit the script with non success status
Help(){
        echo "Error: You need to provide a valid server id."
        exit 1;
}

AWS_SERVER="localhost"
KEY="`dirname "$0"`"/keys/CHANGE_HERE.pem

if [ $# -lt 1 ]
then
    Help
fi

SRV=$1

AWS_SERVER="`cat hostnames | grep -E "$SRV" | cut -f 2`"
AWS_SERVER_NAME="`cat hostnames | grep -E "$SRV" | cut -f 3`"

if [[ -z "$AWS_SERVER_NAME" ]]
then
	echo "AWS_SERVER-[$AWS_SERVER]"
else
	echo "$AWS_SERVER_NAME-[$AWS_SERVER]"
fi

