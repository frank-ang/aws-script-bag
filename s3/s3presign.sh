#!/bin/bash
S3_URI=$1
EXPIRE_SECONDS=${2:-86400} 

if [ -z "$S3_URI" ]; then
    echo "missing S3_URI" 1>&2
    exit 1
fi

echo "signing S3_URI:$S3_URI, with expiry secs:$EXPIRE_SECONDS (max 604799)"

aws s3 presign "$S3_URI" --expires-in "$EXPIRE_SECONDS"