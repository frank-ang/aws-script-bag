#!/bin/bash
while true; do 
	echo `date -u '+%Y-%m-%dT%k:%M:%S'` `host $MYSQL_HOST | grep -o 'address.*'`;
	mysql --defaults-extra-file=~/mysql.secrets --connect-timeout=1 -e "use test;" test
	sleep 1;
done; | tee connection-test.txt
