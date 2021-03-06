#!/bin/bash
NAME=${NAME:-$(hostname)}
WORK_DIR=${WORK_DIR:-_work}

if [ -e "/var/run/docker.sock" ]; then
    sudo chgrp runner /var/run/docker.sock
fi

if [ ! $URL ]; then
    echo 'Need: $URL'
    exit 1
fi

if [ ! $TOKEN ]; then
    echo 'Need: $TOKEN'
    exit 1
fi

[ -d _token ] && cp -R _token/. .
[ ! -f .credentials ] && ./config.sh --url $URL --token $TOKEN --name $NAME --work $WORK_DIR --replace
[ -d _token ] && cp .env .path .runner .credentials* _token

./run.sh