# docker-github-actions-runner
Dockerize self-hosted github runner

## Example
```
docker run -it --rm \
    -e URL=https://github.com/swaglive/docker-github-actions-runner \
    -e TOKEN=MYTOKEN \
    -e NAME=rammus-mbp \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $PWD/_token:/home/runner/_token \
    --name swaglive/runner swaglive/github-runner
```


## Debug
```
docker run -it --rm \
    -e URL=https://github.com/swaglive/docker-github-actions-runner \
    -e TOKEN=MYTOKEN \
    -e NAME=rammus-mbp \
    --entrypoint /bin/bash \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $PWD/_token:/home/runner/_token \
    --name runner swaglive/github-runner
```
