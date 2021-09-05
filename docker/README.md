# Docker

## Commands

```bash
# open container console
docker exec -it <container-name> bash
```

```bash
# update container configuration to auto restart
docker update --restart=always postgres
```

```bash
# list running containers
docker ps
```

```bash
# list all containers running/stopped
docker ps --all
```

```bash
# stop all containers
docker stop $(docker ps --all --quiet)

# remove all containers
docker rm $(docker ps --all --quiet)
```

```bash
# clean reset docker
docker system prune --all --volumes

# remove all volumes
docker system prune --volumes
```

## Docker Compose

```bash
# run containers, if you close current session the containter will be stopped
docker-compose up

# run containers in the background
docker-compose up --detach

# run containers only 'db' service specified
docker-compose up --detach db
```
