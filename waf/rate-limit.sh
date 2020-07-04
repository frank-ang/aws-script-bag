#!/bin/bash
# Test WAF Rate limiting rules to a specified URL.
# Requests should be blocked 403 after exceeding the request rate (e.g. 100 per 5 mins)
if [ -f "config.gitignore" ]; then
    source "config.gitignore"
fi

i=1
until [ $i -gt 500 ]; do
	echo "$i" `date +%Y-%m-%dT%H:%M:%S%z` `curl -o /dev/null -s -w "%{http_code}\n" -X POST $LOGIN_URL`
	i=$((i+1))
	sleep 1
done
