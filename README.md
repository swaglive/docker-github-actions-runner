# docker-github-actions-runner
Find `URL` and `TOKEN` in repository Settings -> Actions -> Add runner.

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


## Debug with swaglive/github-runner
```
docker run -it --rm \
    -e URL=https://github.com/swaglive/docker-github-actions-runner \
    -e TOKEN=MYTOKEN \
    -e NAME=rammus-mbp \
    --entrypoint /bin/bash \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $PWD/_token:/home/runner/_token \
    --name runner swaglive/github-runner

runner@a42e26ab99b5:~$ /entrypoint.sh 
```

## Reference
- https://github.com/actions/runner
- https://serverfault.com/questions/819369/mounting-a-volume-with-docker-in-docker
