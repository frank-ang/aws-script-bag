#!/bin/bash

# Reduce CloudWatch logs retention period from infinity to a small number of days, to limit costs.

declare -r RETENTION="30"
for L in $(aws logs describe-log-groups \
    --query 'logGroups[?!not_null(retentionInDays)] | [].logGroupName' \
    --output text)
do
   echo setting retention for log-group-name:${L} to retention-in-days:${RETENTION}
   aws logs  put-retention-policy --log-group-name ${L} \
   --retention-in-days ${RETENTION}
done
