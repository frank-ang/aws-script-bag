#!/bin/bash
. ./private.gitignore
echo "$DB_PASSWORD"
ssh ec2-user@${BASTION_IP} -L 3306:${DB_HOST}:3306 -fN
echo "Verifying connection to local tunnel ..."
mysql -u ${DB_USER} -p${DB_PASSWORD} -h 127.0.0.1 -e "show databases"
