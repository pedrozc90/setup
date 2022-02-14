#!/bin/bash

docker build --no-cache \
    --file ./Dockerfile \
    --tag sbt-node \
    .

docker run -it --rm sbt-node bash
