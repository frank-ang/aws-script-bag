#!/bin/bash
KEYFILE="fileb://$1"
KEYNAME="$2"
REGION="$3"
if [ -z "$1" ] | [ -z "$KEYNAME" ] | [ -z "$REGION" ]; then
    echo "Usage $0 [KEYFILE] [KEYNAME] [REGION]" 1>&2
    exit 1
fi

echo "importing key file: $KEYFILE, into keypair name: $KEYNAME, into AWS region: $AWS_DEFAULT_REGION"
aws ec2 import-key-pair --key-name "$KEYNAME" --public-key-material "$KEYFILE" --region "$REGION"