```bash
mkdir -p /data/docker/rabbitmq

# web-mqtt (ws)15675
# managemnet ui 15672
docker run -d --restart unless-stopped --name=rabbitmq \
 -p 15676:15675 \
 -p 15672:15672 \
 -v /data/docker/rabbitmq:/var/lib/rabbitmq \
 --log-opt max-size=10m --log-opt max-file=5 \
 -e RABBITMQ_ERLANG_COOKIE='EOzFBGMs1AK6E5QIat444' \
 crusaderrocks/rabbitmqtt

docker exec -it rabbitmq bash

rabbitmqctl add_user admin rba9mcQLz8dQr9LL \
&& rabbitmqctl set_user_tags admin administrator \
&& rabbitmqctl set_permissions -p / admin "." "." ".*" \
# repetir para criar mais usuarios
&& rabbitmqctl add_vhost dev \
&& rabbitmqctl add_user admindev 5jJYVDCja3uRYfRS \
&& rabbitmqctl set_user_tags admindev administrator \
&& rabbitmqctl set_permissions -p dev admindev "." "." ".*"
```

```bash
VHOST=dev

# LISTANDO TODAS AS QUEUES DO VHOST
rabbitmqctl list_queues --silent --vhost $VHOST name state messages

# DELETANDO TODAS AS QUEUES DO VHOST
for queue in $(rabbitmqctl list_queues --silent --vhost $VHOST name); do rabbitmqctl delete_queue --vhost $VHOST $queue; done
```

## [DockerHub](https://hub.docker.com/_/rabbitmq)

```bash
# create new directory
mkdir --parents ./data

# create named volume
docker volume create \
    --driver local \
    --opt o=bind \
    --opt type=none \
    --opt device=./data \
    rabbitmq-volume

# run/create container
docker run --detach \
    --name rabbitmq \
    --hostname rabbitmq \
    --volume rabbitmq-volume:/var/lib/rabbitmq \
    --publish 5672:5672 \
    --publish 15672:15672 \
    --env RABBITMQ_DEFAULT_USER=pedrozc90
    --env RABBITMQ_DEFAULT_PASS=AeYreOty
    --env RABBITMQ_DEFAULT_VHOST=master
    rabbitmq:3.9.13-management-alpine
```

> Access management interface http://127.0.0.1:15672
