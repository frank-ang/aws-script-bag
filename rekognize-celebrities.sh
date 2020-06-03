#!/bin/bash
echo "attempting recognize-celebrities in file $1"
aws rekognition recognize-celebrities --image-bytes "fileb://$1"