# Raspberry Pi 4

## Find IP Address

```bash
nmap -sn 192.168.15.1/24
```

## Packages

```bash
apt install -y neofetch
```

## Setup Static IP

```bash
sudo nano /etc/netplan/01-server-init.yml
```

```txt
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses: [192.168.15.169/24]
      gateway4: 192.168.15.1
      nameservers:
        addresses: [192.168.15.1]
```

```bash
sudo netplan apply
```

## Docker

### Install

```bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh
```

### Enable `docker` non `root` user

```bash
sudo usermod -aG docker $USER
```

### Fix `permission denied /var/run/docker.sock`

```bash
sudo chmod 666 /var/run/docker.sock
```
