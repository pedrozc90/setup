FROM busybox

# create and change directory
WORKDIR /build-context

# copy all files to the image (.dockerignore will filter unwanted files)
COPY . .

CMD find .
