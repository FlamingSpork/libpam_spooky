# `libpam_spooky`
`libpam_spooky` is a set of bash scripts that keep editing the PAM config to allow login with a wrong password.

## Linux
For Linux, this includes a systemd service file to run the script constantly, as well as a script to make sure the service is running and an installer (WIP).

To install, run `install.sh` as root, and it should download the other components to the correct locations and start the service.
Once the service is running, you should be able to log into the machine over ssh using an incorrect password.  
(login with an empty password will still error due to how SSHd handles logins)

## FreeBSD
On FreeBSD, the script runs once and does not (yet) have an installer.  
This is mostly because service setup is more difficult on BSD and because it's unlikely that other teams will include a BSD box in their topos.

## Testing
The scripts have been tested on:

- [x] FreeBSD 12
- [ ] CentOS
- [ ] Ubuntu
