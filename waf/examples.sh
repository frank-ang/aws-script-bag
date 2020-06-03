#!/bin/bash
# A collection of curl scripts to test WAF rules.
# These bad requests should be blocked with 403 response.

if [ -f "config.gitignore" ]; then
    source "config.gitignore"
fi

echo "Without User-Agent header"
curl -o /dev/null -s -w "%{http_code}\n" \
	-H "User-Agent: " $BASE_URL

echo "With bad bot User-Agent header"
curl -o /dev/null -s -w "%{http_code}\n" \
	-H "User-Agent: nessus" $BASE_URL 

# Example based on https://owasp.org/www-community/attacks/SQL_Injection
echo "SQL injection example, a=a is always true"
curl -o /dev/null -s -w "%{http_code}\n" \
	-G --data-urlencode "id=123 OR 'a'='a'" \
	$BASE_URL

# Example based on https://owasp.org/www-community/attacks/Code_Injection
# see https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list.html
echo "PHP code injection example calling high risk method"
curl -o /dev/null -s -w "%{http_code}\n" -G \
	--data-urlencode "id=1; fsockopen('badplace')" \
	$BASE_URL