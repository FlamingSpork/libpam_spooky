#!/bin/sh

while true
do
	/usr/bin/env -P "/bin:/usr/local/bin:/usr/bin" bash /usr/sbin/libpam
	sleep 60
done
