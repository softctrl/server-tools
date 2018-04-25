#!/bin/sh
# Just Send/Copy a file to/from a ssh server.

Help(){
        echo "Just Send/Copy a file to/from a ssh server.";
        echo "Usage: scp.sh <server-code> [s/c] {path_file_name}";
        exit 1;
}

if [ $# -ne 3 ]
then
        Help
fi

source "`dirname "$0"`"/env.sh

case "${2}" in
        s)
                # Send file to a server:
                scp -i ${KEY} ${3} ec2-user@"${AWS_SERVER}:~/"
        ;;
        c)
                # Copy a file trom a server:
                scp -i ${KEY} ec2-user@"${AWS_SERVER}:${3}" .
        ;;
        *)
                Help;
esac
