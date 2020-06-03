#!/bin/bash
# Delete Quicksight users that match a pattern.
# The intention is retain 1 free admin SSO user with the "AdministratorAccess" name prefix.

USER_PATTERN='SandboxUser' 
REGION=us-east-1
ACCOUNT=`aws sts get-caller-identity --query 'Account' --output text`

if [ -z "$ACCOUNT" ] ; then
	echo "Account ID not provided"
	exit 1
fi
if [ -z "$REGION" ] ; then
    echo "Usage $0 [REGION]" 1>&2
    exit 1
fi

USERLIST=`aws quicksight list-users --aws-account-id $ACCOUNT --namespace default \
		 --region $REGION --query "UserList[].UserName" --output text`
echo "Quicksight user list: $USERLIST"

echo "Deleting Quicksight users that with names that match pattern: $USER_PATTERN"
for USERNAME in $USERLIST; do
	if [[ $USERNAME =~ $USER_PATTERN ]];
		then
			echo "deleting $USERNAME"
			aws quicksight delete-user --user-name $USERNAME --aws-account-id $ACCOUNT --namespace default --region $REGION
		else
			echo "skipping $USERNAME"
		fi
done

