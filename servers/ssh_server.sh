#!/bin/bash

source "`dirname "$0"`"/env.sh
ssh -i $KEY ec2-user@$AWS_SERVER
