# My Instance Scheduler notes

Reference the solution here: https://aws.amazon.com/solutions/implementations/instance-scheduler/

Docs here: https://docs.aws.amazon.com/solutions/latest/instance-scheduler/welcome.html


## Weekdays instances.

```bash
scheduler-cli create-period --name "weekdays" --begintime 09:00 --endtime 18:00 --weekdays mon-fri --stack instance-scheduler

scheduler-cli create-schedule \
	--description "weekday scheduled instances" \
	--name weekday-schedule \
	--periods weekdays \
	--enforced true \
	--stack instance-scheduler

scheduler-cli describe-periods --stack instance-scheduler
scheduler-cli describe-schedules --stack instance-scheduler
scheduler-cli describe-schedule-usage --stack instance-scheduler --name weekday-schedule
```

> Tagging: on ec2 instances, add tag Schedule=weekday-schedule


## Weekly start Dev Desktop Cloud9 for patching.

```bash
scheduler-cli create-period --name "weeklypatch" --begintime 14:00 --endtime 18:00 --weekdays fri --stack instance-scheduler

scheduler-cli create-schedule \
	--description "weekly patching scheduled instances" \
	--name weeklypatch-schedule \
	--periods weeklypatch \
	--stack instance-scheduler

scheduler-cli describe-schedule-usage --stack instance-scheduler --name weeklypatch-schedule

```

> Tagging: add tag ```"Schedule=weeklypatch-schedule"```, to EC2 instances, Cloud9 instances, RDS instances, or Aurora Clusters. RDS can be stopped for max 7 days.

