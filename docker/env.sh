#!/bin/sh
export RUNNER_IMAGE_NAME=anomaly_detection_runner
export IMAGE_VERSION=2.1
export RUNNER_CONTAINER_NAME=${USER}_${RUNNER_IMAGE_NAME}
export VIEWER_CONTAINER_NAME=${USER}_${VIEWER_IMAGE_NAME}
export DATASET_DIR=/raid/qcd/model_asset/anomaly_detection/datasets
