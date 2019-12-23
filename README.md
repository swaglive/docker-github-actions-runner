## Example
```
docker run -it --rm \
    -e URL=https://github.com/swaglive/docker-github-actions-runner \
    -e TOKEN=MYTOKEN \
    -e AGENT=rammus-mbp \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name swaglive/runner swaglive/github-runner
```


## Debug
```
docker run -it --rm \
    -e URL=https://github.com/swaglive/docker-github-actions-runner \
    -e TOKEN=MYTOKEN \
    -e AGENT=rammus-mbp \
    --entrypoint /bin/bash \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name runner swaglive/github-runner
```