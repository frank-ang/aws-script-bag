#!/bin/bash
# Sends SNS messages

PHONENUMBER=$1
COUNT=1
INTERVAL_SECS=1

if [ -z "$PHONENUMBER" ]; then
    echo "Usage $0 [PHONENUMBER]" 1>&2
    exit 1
fi

for i in {1..$COUNT}
do
	echo sending sms to phone: $PHONENUMBER, iteration: $i, 
	aws sns publish --phone-number "$PHONENUMBER" --message "hello at `date -u`"
	sleep $INTERVAL_SECS
done

