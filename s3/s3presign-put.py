import boto3
from botocore.client import Config
import argparse


def create_presigned_put_url(bucket_name, object_name, expiration=604800):
    """Generate a presigned URL to share an S3 object

    :param bucket_name: string
    :param object_name: string
    :param expiration: Time in seconds for the presigned URL to remain valid
    :return: Presigned URL as string. If error, returns None.
    """

    # Generate a presigned URL for the S3 object
    s3_client = boto3.client('s3')
    try:
        response = s3_client.generate_presigned_url('put_object',
                                                    Params={'Bucket': bucket_name,
                                                            'Key': object_name},
                                                    ExpiresIn=expiration)
    except ClientError as e:
        logging.error(e)
        return None

    # The response contains the presigned URL
    return response


parser = argparse.ArgumentParser("generate_signed_url")
parser.add_argument("--bucket", help="S3 Bucket", type=str, required=True)
parser.add_argument("--key", help="S3 key", type=str, required=True)
parser.add_argument("--expires_in", help="Expire in", type=int, default=604800)
args = parser.parse_args()

url = create_presigned_put_url(args.bucket, args.key, args.expires_in)

print(url)
