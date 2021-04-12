#!/bin/bash
# Enables S3 block public access on the configured AWS account. 

ACCOUNT_ID=`aws sts get-caller-identity --query 'Account' --output text`
if [ -z "$ACCOUNT_ID" ]; then
    echo "Missing ACCOUNT_ID" 1>&2
    exit 1
fi

echo "Current S3 block public access setting (if exists) on account $ACCOUNT_ID:"
aws s3control get-public-access-block --account-id $ACCOUNT_ID 
read -p "Enabling S3 block public access setting on account $ACCOUNT_ID, Press enter to continue..."

aws s3control put-public-access-block \
    --account-id $ACCOUNT_ID \
    --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'

sleep 1 # wait for eventual consistency

echo "Done. New S3 block public access setting:"
aws s3control get-public-access-block --account-id $ACCOUNT_ID 
