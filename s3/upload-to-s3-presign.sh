#!/bin/bash

FILE=$1
S3_BUCKET=$2
S3_PATH=$3
if [ -z "$FILE" ] | [ -z "$S3_BUCKET" ] | [ -z "$S3_PATH" ]; then
    echo "Usage $0 [FILE] [S3_BUCKET] [S3_PATH]" 1>&2
    exit 1
fi

S3_PRESIGN_PUT_URL=`python ./s3presign-put.py --bucket "$S3_BUCKET" --key "$S3_PATH" --expires_in 604800`

echo "##### Uploading to S3_PRESIGN_PUT_URL : $S3_PRESIGN_PUT_URL"
./s3upload-presign.sh "$FILE" "$S3_PRESIGN_PUT_URL"

sleep 1

S3_URL="s3://$S3_BUCKET/$S3_PATH"
S3_PRESIGN_GET_URL=`./s3presign-get.sh "$S3_URL" 604000`
echo "##### Downloading object from S3_PRESIGN_GET_URL : $S3_PRESIGN_GET_URL"

VERIFY_FILE="/tmp/"`basename $FILE`".verify"
rm -f $VERIFY_FILE
curl -o $VERIFY_FILE "$S3_PRESIGN_GET_URL"

cmp --silent "$VERIFY_FILE" "$FILE" && echo "PASSED: files are identical" || ( echo "FAILED: files are different" && exit 1 )
