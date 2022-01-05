#!/bin/bash

CONTAINER_NAME=blink-led
FLAG="${1-}"

# logs out key :/
docker_build () {
  docker build \
    --build-arg ssh_prv_key="$(cat ~/.ssh/rpi)" \
    --build-arg ssh_pub_key="$(cat ~/.ssh/rpi.pub)" \
    -t ${CONTAINER_NAME} .
}

docker_run () {
  docker run -it --rm --name blink-led-docker ${CONTAINER_NAME}
}


if [[ "$FLAG" = "--build" ]]; then
  docker_build
elif [[ "$FLAG" = "--run" ]]; then
  docker_run
else
  docker_build && docker_run
fi
