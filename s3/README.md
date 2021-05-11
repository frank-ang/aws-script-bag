# S3 scripts

## Example S3 signed URL upload / download.

Example to: 1. Generate an S3 Signed URL for PUT, 2. PUT a file, 3. Generate an S3 Signed URL for GET, 4. Download the file, 5. compare the uploaded and downloaded files.

To run:

1. Edit the file [s3/test-s3-presign-upload.sh]() , set your parameters for ```S3_BUCKET``` and ```S3_PATH```

2. Run the Bash test script ```test-s3-presign-upload.sh```

```bash
$ ./test-s3-presign-upload.sh 
-bash: ./test-s3-presign-upload.sh: No such file or directory
frankang@large:aws-script-bag$ cd -
/Users/frankang/lab/Playground/aws-script-bag/s3
frankang@large:s3$ ./test-s3-presign-upload.sh 
##### Uploading to S3_PRESIGN_PUT_URL : https://sandbox00-datalake-sin.s3.amazonaws.com/upload/foo.txt?AWSAccessKeyId=SOMETHINGSOMETHINGREDACTED&Signature=SOMETHINGSOMETHINGREDACTED%2BvcpDTM4%3D&Expires=1620725720
### Uploading file:/tmp/foo.txt to S3 Presign URL:https://sandbox00-datalake-sin.s3.amazonaws.com/upload/foo.txt?AWSAccessKeyId=SOMETHINGSOMETHINGREDACTED&Signature=SOMETHINGSOMETHINGREDACTED%2BvcpDTM4%3D&Expires=1620725720
*   Trying 52.219.32.216...
* TCP_NODELAY set
* Connected to sandbox00-datalake-sin.s3.amazonaws.com (52.219.32.216) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/cert.pem
  CApath: none
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server did not agree to a protocol
* Server certificate:
*  subject: C=US; ST=Washington; L=Seattle; O=Amazon.com, Inc.; CN=*.s3.amazonaws.com
*  start date: Jan 11 00:00:00 2021 GMT
*  expire date: Feb 11 23:59:59 2022 GMT
*  subjectAltName: host "sandbox00-datalake-sin.s3.amazonaws.com" matched cert's "*.s3.amazonaws.com"
*  issuer: C=US; O=DigiCert Inc; OU=www.digicert.com; CN=DigiCert Baltimore CA-2 G2
*  SSL certificate verify ok.
> PUT /upload/foo.txt?AWSAccessKeyId=SOMETHINGSOMETHINGREDACTED&Signature=SOMETHINGSOMETHINGREDACTED%2BvcpDTM4%3D&Expires=1620725720 HTTP/1.1
> Host: sandbox00-datalake-sin.s3.amazonaws.com
> User-Agent: curl/7.64.1
> Accept: */*
> Content-Length: 29
> Expect: 100-continue
> 
< HTTP/1.1 100 Continue
* We are completely uploaded and fine
< HTTP/1.1 200 OK
< x-amz-id-2: SOMETHINGSOMETHINGREDACTED
< x-amz-request-id: SOMETHINGSOMETHINGREDACTED
< Date: Tue, 11 May 2021 08:35:21 GMT
< x-amz-version-id: SOMETHINGSOMETHINGREDACTED
< ETag: "SOMETHINGSOMETHINGREDACTED"
< Content-Length: 0
< Server: AmazonS3
< 
* Connection #0 to host sandbox00-datalake-sin.s3.amazonaws.com left intact
* Closing connection 0
##### Downloading object from S3_PRESIGN_GET_URL : https://sandbox00-datalake-sin.s3.ap-southeast-1.amazonaws.com/upload/foo.txt?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=SUPERSECRET%2F20210511%2Fap-southeast-1%2Fs3%2Faws4_request&X-Amz-Date=20210511T083522Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=SUPERSECRET123123123123123123123123123123
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    29  100    29    0     0    252      0 --:--:-- --:--:-- --:--:--   252
PASSED: files are identical

```

Successful test displays the ```PASSED``` message.