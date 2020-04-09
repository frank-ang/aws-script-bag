COUNT=3
INTERVAL_SECS=1
for i in {1..$COUNT}
do
	echo iteration $i, sleeping $INTERVAL_SECS
	sleep $INTERVAL_SECS
done

# aws sns publish --phone-number "+6594797043" --message "hello at `date -u`"
