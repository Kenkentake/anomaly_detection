#!/bin/sh
. docker/env.sh

# Run runner image
docker stop $RUNNER_CONTAINER_NAME
docker run \
  -dit \
  --gpus all \
  --user $(id -u):$(id -g) \
  -v $PWD:/workspace \
  -v $DATASET_DIR:/datasets \
  --name $RUNNER_CONTAINER_NAME \
  --network host \
  --rm \
  --shm-size=20g \
  $RUNNER_IMAGE_NAME:$IMAGE_VERSION
