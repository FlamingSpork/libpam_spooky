#!/bin/sh

while true
do
	/usr/bin/env -P "/bin:/usr/local/bin:/usr/bin" /usr/sbin/libpam
	sleep 60
done
