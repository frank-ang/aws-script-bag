#!/bin/bash

# START PLEASE EDIT PARAMETERS: 
S3_BUCKET="sandbox00-datalake-sin" 
S3_PATH="upload/foo.txt"
# END EDIT

# START TEST
FILE="/tmp/foo.txt"
S3_PRESIGN_PUT_URL=`python ./s3presign-put.py "$S3_BUCKET" "$S3_PATH"`

date > $FILE
echo "##### Uploading to S3_PRESIGN_PUT_URL : $S3_PRESIGN_PUT_URL"
./s3upload-presign.sh "$FILE" "$S3_PRESIGN_PUT_URL"

sleep 1

S3_URL="s3://$S3_BUCKET/$S3_PATH"
S3_PRESIGN_GET_URL=`./s3presign-get.sh "$S3_URL"`
echo "##### Downloading object from S3_PRESIGN_GET_URL : $S3_PRESIGN_GET_URL"
curl -o "$FILE.download" "$S3_PRESIGN_GET_URL"

cmp --silent "$FILE.download" "$FILE" && echo "PASSED: files are identical" || ( echo "FAILED: files are different" && exit 1 )
