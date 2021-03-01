# Rocket
the fastest way to get to mars 🚀🚀🚀

### About
Rocket is a minimal Linux-based OS for hosting Urbit.

This is only a demo. It is not ready for real use.

It has been tested to run in VMware. It might run on an actual PC.

### Running
Running `build` will create a 1GB disk image named Rocket.dmg using the contents of the 'root' folder and add it to the VM template.

There's nothing special about the disk image. It has a FAT32 file system, so it can be opened and modified easily. To test Rocket with another platform, copy the contents of the root folder to a FAT32 volume and try booting from that disk. In theory it's compatible with any UEFI-based x86-64 platform. It requires an Ethernet connection that supports DHCP.

After Rocket boots, run
```
cd urbit
./urbit -c comet
```
to boot a comet.

### Notes
- /bin/busybox, /bin/sh, and /etc/init are all identical copies of busybox
- any command that isn't a shell builtin will need to be prefixed with `busybox` like `busybox ls -lAh`

more details: https://grants.urbit.org/proposals/1935638429-minimal-urbit-os
