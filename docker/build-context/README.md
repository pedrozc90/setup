# Build Context

+   [busybox](https://hub.docker.com/_/busybox)
+   [how-to-test-dockerignore-file](https://stackoverflow.com/questions/38946683/how-to-test-dockerignore-file)

```bash
# create busybox image using cmd
docker build --tag build-context --file - . <<EOF
FROM busybox
WORKDIR /build-context
COPY . /build-context
CMD find .
EOF
```

```bash
# create busybox image using dockerfile
docker build --file build-context --tag build-context .
```

```bash
# inspect container files using shell
docker run -it --rm build-context sh
```
