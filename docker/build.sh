#!/bin/sh
. docker/env.sh

docker inspect --type=image $RUNNER_IMAGE_NAME:$IMAGE_VERSION > /dev/null

if test 1 -eq $?  ; then
  echo "creating one"
  docker build \
    -f docker/Dockerfile \
    -t $RUNNER_IMAGE_NAME:$IMAGE_VERSION \
    --network=host \
    --force-rm=true \
    .
else
  echo "Image already exists, try running container instead."
fi

docker inspect --type=image $VIEWER_IMAGE_NAME:$IMAGE_VERSION > /dev/null
