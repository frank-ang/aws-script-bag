#!/bin/bash
# example textract.

S3BUCKET=www.sandbox00.demolab.host
S3OBJECT=tmp/namecards/john_smith.png
echo "textract on: $S3BUCKET $S3OBJECT"
DOCUMENT_PARAM='{"S3Object":{"Bucket":"'$S3BUCKET'","Name":"'$S3OBJECT'"}}'
echo "DOCUMENT_PARAM: $DOCUMENT_PARAM"

aws textract detect-document-text \
	--document "$DOCUMENT_PARAM"
