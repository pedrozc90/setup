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

3. Run Arch Linux Install Script

```bash
archinstall
```

> This commands open a iteractive menu to configure. Change the follow options:

- Keyboard layout: `US-Internacional`
- Mirror region: `United States`, `Brazil`
- Locales: `en_US.UTF-8`
- Disk configuration: `etx4`, `/boot`, `/`
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

4. GRUB

```bash
sudo pacman -S os-probe git
```

edit `/etc/default/grub`

```bash
# uncomment line to enabled os-probe
GRUB_DISABLE_OS_PROBER=false
```

```bash
# update /boot/grub/grub.cfg with os-probe
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

```bash
# print menu entries
cat /boot/grub/grub.cfg | grep '^menuentry'
```

> change default boot to windowns by replacing `GRUB_DEFAULT`

```text
GRUB_DEFAULT=0
```

```text
GRUB_DEFAULT="Windows Boot Manager (on /dev/nvme0n1p1)"
```


5. GIT

```bash
git config --global user.name "pedrozc90"
git config --global user.email "pedrozc90@gmail.com"
git config --global core.autocrlf true
git config --global init.defaultBranch "master"
```

5. AUR

```bash
# install rust
sudo pacman -S rustup

# clone paru repository
git clone https://aur.archlinux.org/paru.git .paru
cd .paru

# install paru
makepkg -si
```

```bash
paru -S google-chrome visual-studio-code-bin
```

6. console

```bash
```

7. Jetbrains Toolbox

```bash
sudo tar -xzf ~/Downloads/jetbrains-toolbox-2.6.3.43718.tar.gz -C /opt

# create toolbox command
sudo ln -s /opt/jetbrains-toolbox-2.6.3.43718/bin/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox
```

8. AWS CodeCommit

```bash
# generate public key for aws code commit
# save at ~/.ssh/codecommit.pub
ssh-keygen -t rsa -b 4096 -C "pedrozc90@gmail.com"
```

> Go to AWS → IAM → Profile → Security Credentials → Upload SSH public key

create `~/.ssh/config` file

```text
Host git-codecommit.*.amazonaws.com
  User APKAEIBAERJR2EXAMPLE  # replace with your SSH Key ID from AWS IAM
  IdentityFile ~/.ssh/codecommit

```

```bash
# set file permission
chmod 600 ~/.ssh/config
```

```bash
# test ssh connetion
ssh git-codecommit.us-east-1.amazonaws.com
```
