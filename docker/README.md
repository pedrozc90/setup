# Docker

## References

-   [Dockerfile Documentation](https://docs.docker.com/engine/reference/builder/)

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

## Mounts

```bash
docker run -it --rm --mount type=bind,source="$HOME/docker",target="/app" --name alpine alpine:3.17
```

## Volumes

```bash
# create named volume
docker volume create my_volume
```

```bash
# creating mapped volume
$DIR_PATH=/path/to/folder

mkdir -p ${DIR_PATH}

docker volume create \
    --driver local \
    --opt o=bind \
    --opt type=none \
    --opt device=${DIR_PATH} \
    my_volume
```

```bash
docker run -it --rm --volumes my_volume:/app --name alpine alpine:3.17
```

```bash
# the volume my_new_volume will be created if does not exists.
docker run -it --rm --mount source=my_new_volume,target=/app --name alpine alpine:3.17
```

```bash
# remove unused volumes
docker volume prune
```

## Networks

```bash
docker network create --driver bridge my-network

docker run -it --rm --name alpine --network my-network alpine:3.17
```

```bash
# enabled comunication from inside container to the host using hostname 'host.docker.internal'
docker run -it --rm \
    --name apline \
    --hostname pong \
    --network my-bridge \
    --add-host=host.docker.internal:host-gateway \
    alpine:3.17
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
