#!/bin/sh
. docker/env.sh
docker exec \
  -it \
  $RUNNER_CONTAINER_NAME bash
