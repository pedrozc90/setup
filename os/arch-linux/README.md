# README

[**Arch Linux**](https://www.archlinux.org/) installation guide.

## Verify Boot Mode

```sh
# vefiry if system requires efi bios
ls /sys/firmware/efi/efivars
```

> if nor files are displayed, you are using BIOS legacy boot mode.

## Verify Internet Connection

```sh
# check internet connection
ip addr show

# if a ip address is shown, test connection by running ping
ping -c 5 www.archlinux.org
```

## Update System Clock

```sh
# show current settings
timedatectl

# set timezone
timedatectl set-timezone America/Sao_Paulo

# enable network time synchronization
timedatectl set-ntp true

# show system status
systemctl status systemd-timesyncd.service

# show current status
timedatectl timesync-status
```

## Partitioning

| Name      | Mount Point   | Partition             | Type                      | Size      |
|----------:|:-------------:|:---------------------:|:-------------------------:|:---------:|
| efi       | /mnt/efi      | /dev/efi_partition    | EFI System Partition (1)  | >= 260MB  |
| swap      | -             | /dev/swap_partition   | Linux Swap (19)           | > 512MB   |
| root      | /mnt          | /dev/root_partition   | Linux Filesystem (ext4)   | MAX       |
| home      | /mnt/home     | /dev/home_partition   | Linux Filesystem (ext4)   | MAX       |

```sh
# display partitions
fdisk --list

# show disk partitions tree structure
lsblk

# select partition
fdisk <partition_name>
fdisk /dev/sda

# filesystems
mkfs.fat -F32 /dev/efi_partition
mkfs.ext4 /dev/root_partition
mkfs.ext4 /dev/home_partition
mkswap /dev/swap_partition

# enable swap
swapon /dev/swap_partition

# first, mount root partition to /mnt
mount /dev/root_partition /mnt

# create directories
mkdir /mnt/home
mkdir /mnt/etc
mkdir /mnt/boot
mkdir /mnt/boot/EFI

# mount home partition
mount /dev/home_partition /mnt/home
mount /dev/efi_partition /mnt/boot/EFI

# generate fstab file
genfstab -U -p /mnt >> /mnt/etc/fstab

# view fstab file
cat /mnt/etc/fstab
```

## Mirror List

```sh
# edit list of urls to select the fastest links
nano /etc/pacman.d/mirrorlist
```

## Install Essentials Packages

```sh
# download and install packages
pacstrap /mnt base base-devel linux linux-firmware nano
```

## Change System Root

```sh
# change system root to /mnt (becoms /)
arch-chroot /mnt
```

## Clock

```sh
# set timezone
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# generate /etc/adjtime
hwclock --systohc
```

## Localization

```sh
# open /etc/locale.gen on a editior and uncomment en_US.UTF-8 UTF-8
# nano /etc/locale.gen
sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen 
locale-gen

# append command to locale.conf
echo LANG=en_US.UTF-8 >> /etc/locale.conf
```

## Host

```sh
# create /etc/hostname file
echo myhostname > /etc/hostname

# edit /etc/hosts
echo 127.0.0.1	localhost >> /etc/hosts
echo ::1		localhost >> /etc/hosts
echo 127.0.1.1	myhostname.localdomain	myhostname >> /etc/hosts
```

# Install Packages

```sh
# install linux kernel
pacman -S linux linux-headers linux-lts linux-lts-headers \
    sudo nano openssh dialog \
    networkmanager wpa_supplicant wireless_tools netctl

# eanble openssh on startup
systemctl enable sshd.service

# enable network manager on startup
systemctl enable NetworkManager
```

# initramfs

```sh
# create a new initramfs
mkinitcpio -p linux

# create a new initramfs for lts
mkinitcpio -p linux-lts
```

# SuperUser

```sh
# change super user password
passwd

# create a normal user
useradd -m -g users -G wheel user_name

# change user password
passwd user_name

# enable sudo for users
EDITOR=nano visudo
# uncomment line %wheel ALL=(ALL) ALL
```

> password: arch

# Boot Loader

```sh
# install required packages
pacman -S grub efibootmgr dosfstools os-prober mtools grub-efi-x86_64

# mount efi partition to /boot/efi
# mkdir /boot/efi
# mount /dev/efi_partition /boot/efi

# install bootloader
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub_efi --recheck

# copy grub files
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

# create grub configuration file
grub-mkconfig -o /boot/grub/grub.cfg
```

# Swap File (Optional)

> optional: replace for swap partition

```sh
# create swap file
fallocate -l 4G /swapfile

# change permission
chmod 600 /swapfile

# set /swalfile as swap
mkswap /swapfile

# creat fstab backup
cp /etc/fstab /stc/fstab.bak

# append to fstab file
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
```

# Extra Packages

```sh
# update packages
pacman -Sy

# install xorg-server
pacman -S xorg-server xorg-xinit

# processor micro
pacman -S amd-ucode

# find out your graphics drivers
lspci | grep VGA

# install vga driver
pacman -S xf86-video-amdgpu

# install gnome optional packages
pacman -S gdm \
    gedit \
    gnome-backgrounds \
    gnome-calculator \
    gnome-control-center \
    gnome-keyring \
    gnome-settings-daemon \
    gnome-shell \
    gnome-shell-extensions \
    gnome-terminal \
    gnome-tweaks \
    nautilus \
    xdg-user-dirs
    # adwaita-icon-theme

# enable gdm on startup
systemctl enable gdm
```

# Done

```sh
# exit terminal
exit

# dismount
umount --all
```
