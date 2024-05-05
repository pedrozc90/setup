# [Redis](https://redis.io/)

## References

-   [DockerHub](https://hub.docker.com/r/amazon/dynamodb-local)
-   [Deploying DynamoDB locally](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.DownloadingAndRunning.html#docker)

## Commands

```bash
version: '3.8'

services:
    dynamodb-local:
        image: "amazon/dynamodb-local:latest"
        container_name: dynamodb-local
        ports:
            - "8000:8000"
        volumes:
            - "./docker/dynamodb:/home/dynamodblocal/data"
        working_dir: /home/dynamodblocal
        command: "-jar DynamoDBLocal.jar -sharedDb -dbPath ./data"

    app-node:
        image: location-of-your-dynamodb-demo-app:latest
        container_name: app-node
        ports:
            - "8080:8080"
        depends_on:
            - "dynamodb-local"
        links:
            - "dynamodb-local"
        environment:
            AWS_ACCESS_KEY_ID: 'FAKE_ACCESS_KEY_ID'
            AWS_SECRET_ACCESS_KEY: 'FAKE_SECRET_ACCESS_KEY'
            REGION: 'FAKE_REGION'
```
