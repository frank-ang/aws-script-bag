aws ssm get-parameter --name /webinar/db-host
aws ssm get-parameter --name /webinar/supersecret --with-decryption

aws ssm get-parameter --name /webinar/db-host \
	--query 'Parameter.Value' --output text
aws ssm get-parameter --name /webinar/supersecret --with-decryption \
    --query 'Parameter.Value' --output text
