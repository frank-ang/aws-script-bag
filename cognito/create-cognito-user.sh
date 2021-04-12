#!/bin/bash
USERNAME=$1
PASSWORD=$2
USERPOOL_ID=REPLACE_ME
APPCLIENT_ID=REPLACE_ME

if [ -z "$USERNAME" ] | [ -z "$PASSWORD" ]; then
    echo "Usage: $0 [USERNAME] [PASSWORD]" 1>&2
    exit 1
fi

aws cognito-idp admin-create-user \
  --user-pool-id $USERPOOL_ID \
  --username $USERNAME
sleep 2
aws cognito-idp admin-set-user-password \
    --user-pool-id  $USERPOOL_ID \
    --username $USERNAME \
    --password $PASSWORD \
    --permanent
