#!/bin/bash
# List IP addresses blocked by rate-based rules
# See:
# https://docs.aws.amazon.com/waf/latest/developerguide/listing-managed-ips.html

if [ -f "config.gitignore" ]; then
    source "config.gitignore"
fi

aws wafv2 get-rate-based-statement-managed-keys \
          --scope REGIONAL \
          --web-acl-name $WEB_ACL_NAME \
          --web-acl-id $WEB_ACL_ID \
          --rule-name $RULE_NAME