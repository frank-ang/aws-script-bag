# EC2 stuff.

# Create EC2 Host via CLI

```
. ./parameters.gitignore

aws ec2 run-instances \
    --image-id $AMI \
    --instance-type t3.micro \
    --key-name $KEYPAIR \
    --security-group-ids $SECURITY_GROUP_IDS \
    --subnet-id $SUBNET_ID \
    --user-data file://userdata-bastion.txt \
    --iam-instance-profile $IAM_INSTANCE_PROFILE \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=bastion}]' 'ResourceType=volume,Tags=[{Key=Name,Value=bastion}]'
```


# Attach additional EBS volume to Ubuntu Linux

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

```bash

# lsblk to view available disk devices and mount points relative to "/dev/"
# e.g. /dev/nvme1n1 not yet mounted.
$ lsblk
...
nvme1n1     259:2    0  500G  0 disk 

# Check filesystem.
# If the output shows simply data, as in the following example output, there is no file system on the device
$ sudo file -s /dev/nvme1n1

# Get UUID and filesystem type
$ lsblk -f
# ... outputs something like the following: 
nvme1n1     xfs                      YOUR_VOLUME_UUID

# (optional) If no filesystem, create one.
sudo mkfs -t xfs /dev/nvme1n1

# Mount
sudo mkdir /data
sudo mount /dev/nvme1n1 /data
# Set file permissions.

# Auto Mount after reboot.
sudo cp /etc/fstab /etc/fstab.orig

# get the uuid
sudo blkid 
# for Ubuntu
sudo lsblk -o +UUID 

# fstab
sudo vim /etc/fstab

# Add the following:
UUID=YOUR_VOLUME_UUID  /data  xfs  defaults,nofail  0  2

# Test unmount/remount
sudo umount /data
sudo mount -a
```