#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-dashpay/mbmd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/mbmd docker/bin/
cp $BUILD_DIR/src/mbm-cli docker/bin/
cp $BUILD_DIR/src/mbm-tx docker/bin/
strip docker/bin/mbmd
strip docker/bin/mbm-cli
strip docker/bin/mbm-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
