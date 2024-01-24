# Raspberry Pi 4

## Packages

```bash
apt install -y neofetch
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
