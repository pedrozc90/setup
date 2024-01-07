# Arch Linux Install

1. Verify Boot Mode

```sh
# vefiry if system requires efi bios
ls /sys/firmware/efi/efivars
```

> if no files are displayed, you are using BIOS legacy boot mode.

2. Verify Internet Connection

```sh
# check internet connection
ip addr show

# if a ip address is shown, test connection by running ping
ping -c 5 www.archlinux.org
```

3. Run ARch Linux Install Script

```bash
archinstall
```

> This commands open a iteractive menu to configure. Change the follow options:

- Keyboard layout: `US-Internacional`
- Mirror region: `United States`, `Brazil`
- Locales: `en_US.UTF-8`
- Disk configuration: `etx4`, `/boot`, `/`, `/home`
- Bootloader: `Grub`
- Unified kernel images: `False`
- Swap: `True`
- Hostname: `pedrozc90`
- Root password: `******`
- User account: `pedrozc90`
- Profile: `Desktop` `Gnome`, `AMD Graphics`
- Audio:
- Kernels: `linux`, `linux-lts`
- Aditional packages: `nano`, `neofetch`, `firefox`, `gedit`
- Network configuration: `NetworkManager`
- Time Zone: `America/Sao_Paulo`
- Automatic time sync (NTP): `True`
