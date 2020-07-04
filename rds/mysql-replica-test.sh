#!/bin/bash

# RDS MySQL failover test script.

MYSQL_HOST=$1

if [ -z "$MYSQL_HOST" ]; then
    echo "missing MYSQL_HOST" 1>&2
    exit 1
fi

while true; do 
	date -u '+%Y-%m-%dT%k:%M:%S';
    host $MYSQL_HOST | grep -o '.has address.';
	mysql --defaults-extra-file=~/mysql.secrets --connect-timeout=1 --host=$MYSQL_HOST -e "SELECT count(*) from test.table1;";
	mysql --defaults-extra-file=~/mysql.secrets --connect-timeout=1 --host=$MYSQL_HOST -e "use test; INSERT into table1 (TEXT1) values ('foobar');";
	sleep 1; 
done;