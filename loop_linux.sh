#!/bin/bash

# Robert Gray <rpg4231@rit.edu>

while true
do
	#check if service is running
	systemctl status libpam
	if [ "$?" != "0" ]
	then
		#not running, so let's try starting it
		systemctl start libpam
		if [ "$?" != "0" ]
		then
			#start failed, so we need to reinstall
			/bin/bash /usr/bin/libpam_update.sh
			exit
		fi
	fi

	sleep 60
done
