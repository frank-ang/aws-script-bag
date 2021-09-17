# S3 scripts

## Usage

Script that uploads a local file to an S3 PUT presigned URL, generates the S3 GET presigned URL for the uploaded file with 7 days expiry, and tests it by downloading and comparing file equivalence.

```bash
upload-to-s3-presign.sh [FILE] [S3_BUCKET] [S3_PATH]

E.g.
upload-to-s3-presign.sh local.txt mybucket share/remote.txt
```

## Old notes: Example S3 signed URL upload / download.

Example:

> 1. Generate an S3 Signed URL for PUT, 
> 2. PUT a file, 
> 3. Generate an S3 Signed URL for GET, prints the URL.
> 4. GET the file, 
> 5. Compare the uploaded and downloaded files, should be identical.

Successful upload displays the ```PASSED: files are identical``` message.