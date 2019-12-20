#!/bin/bash
test $WORK_DIR || WORK_DIR='_work'
test $AGENT || AGENT=$(hostname)

if [[ -e "/var/run/docker.sock" ]]; then
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

echo -ne 'Y\n\n' | ./config.sh --url $URL --token $TOKEN --name $AGENT --work $WORK_DIR 
./run.sh