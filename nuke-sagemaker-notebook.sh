#!/bin/bash
# Delete Sagemaker notebooks.

REGION=us-east-1

NOTEBOOK_INSTANCE_NAME_LIST=`aws sagemaker --region $REGION list-notebook-instances --query 'NotebookInstances[].NotebookInstanceName' --output text`

WAIT_TIME_SECS=300
SLEEP_TIME_SECS=10

for NOTEBOOK_INSTANCE_NAME in $NOTEBOOK_INSTANCE_NAME_LIST; do
	while [ $WAIT_TIME_SECS -gt 0 ]; do
		STATUS=`aws sagemaker --region $REGION describe-notebook-instance --notebook-instance-name $NOTEBOOK_INSTANCE_NAME --query 'NotebookInstanceStatus' --output text`
		echo "Notebook: $NOTEBOOK_INSTANCE_NAME, status: $STATUS"
		if [ "$STATUS" = "InService" ]; then
			echo "Stopping SageMaker notebook instances: $NOTEBOOK_INSTANCE_NAME"
			aws sagemaker --region $REGION stop-notebook-instance --notebook-instance-name $NOTEBOOK_INSTANCE_NAME 
		fi;
		if [ "$STATUS" = "Stopped" ]; then
			echo "Deleting SageMaker notebook instances: $NOTEBOOK_INSTANCE_NAME"
			aws sagemaker --region $REGION delete-notebook-instance --notebook-instance-name $NOTEBOOK_INSTANCE_NAME
			break
		fi;
		if [ "$STATUS" = "Deleting" ]; then
			break
		fi;
		sleep $SLEEP_TIME_SECS
		WAIT_TIME_SECS=$((WAIT_TIME_SECS-$SLEEP_TIME_SECS))
	done
done
