#!/bin/bash
FILE=$1
S3_PRESIGN_URL=$2

if [ -f "$FILE" ] | [ -z "$S3_PRESIGN_URL" ]; then
    echo "Usage: $0 [FILE] [S3_PRESIGN_URL]" 1>&2
    exit 1
fi

echo "### Uploading file:$FILE to S3 Presign URL:$S3_PRESIGN_URL"

curl -v --upload-file $FILE "$S3_PRESIGN_URL"