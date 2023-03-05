# Rocket
the fastest way to get to mars 🚀🚀🚀

[![awesome urbit badge](https://img.shields.io/badge/~-awesome%20urbit-lightgrey)](https://github.com/urbit/awesome-urbit)

### About
Rocket is a minimal Linux-based OS for Urbit. It's currently useful for experiments. It's been tested to run in VMware and on a recent Intel laptop.

### Getting started

Rocket is distributed as a bootable .efi file. Only x86-64 with UEFI is supported right now. ARM64 support is planned. To run it, you'll need an EFI system partition. Most computers will recognize any FAT32 formatted drive as one.

Download a .efi file from the releases page and copy it to this location on your drive, creating the EFI and BOOT folders if needed:
```
Linux/macOS: /path/to/drive/EFI/BOOT/bootx64.efi
Windows: X:\EFI\BOOT\bootx64.efi
```
Boot the computer with the drive connected. Make sure the computer is in UEFI mode and secure boot is disabled.
The drive should appear in the computer's list of boot devices and Rocket should load if you select that drive.

### Using Rocket

- Rocket runs entirely from RAM. Unless you choose to mount a drive and copy data to it, all changes will be lost once the computer is turned off.
- Rocket includes just enough to enable it to rebuild itself, but not much else. Currently included is a copy of BusyBox which provides most of the programs available, GNU Make, musl libc, and Clang, LLD, ar, and libc++ from LLVM.
- All programs are statically linked. Most C and C++ programs should build without much trouble. For now, you'll need to use something like `LDFLAGS="--static"` when compiling anything.
- Some BusyBox programs are less useful than versions of that program found elsewhere. Additional programs will be made available soon that can be manually added.
- Rocket doesn't currently support WiFi, although that will be added soon. If your computer has an ethernet connection and the hardware is supported by Rocket, you should be able to run `ifconfig eth0 up`, then `udhcpc` to get the connection working.
- On startup, Rocket looks for a disk with the label `ROCKET`. If it finds one, it'll be mounted read-only at `/disk/boot`. It will then try to run `/disk/boot/rocket-startup.sh` if it exists. All files on FAT32 will automatically have execute permissions, but other file systems will need `chmod +x /disk/boot/rocket-startup.sh`. There is a 15 second delay at startup if a disk with that label can't be found. FAT32, NTFS, and ext2/3/4 are supported right now.
- Docker should work using the static binaries available here: https://docs.docker.com/engine/install/binaries/

### Roadmap
- Remove unnecessary code and dependencies
- Make some useful programs available as static binaries (suggestions welcome [here](https://github.com/forfel-norfel/rocket/issues/18))
- Add a GPU driver and some minimal code needed to use it to support Urbit GUI app development
- Proper documentation
- ARM64 support (request support for specific hardware [here](https://github.com/forfel-norfel/rocket/issues/24))

All of the source code for Rocket is over here for now: https://github.com/forfel-norfel/rocket-build/tree/intel
It'll be migrated to this repository once most of it has been deleted.
