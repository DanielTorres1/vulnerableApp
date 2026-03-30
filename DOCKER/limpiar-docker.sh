#!/bin/bash
# remove exited containers:
docker ps --filter status=dead --filter status=exited -aq | xargs -r docker rm -v
    
# remove unused images:
docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs -r docker rmi

# remove unused volumes:
find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d | grep -vFf <(docker ps -aq | xargs docker inspect | jq -r '.[]| .Mounts | .[] | .Name | select(.)') | xargs -r rm -fr

docker system prune -a -f
docker kill $(docker ps -q)
docker_clean_ps
docker rmi $(docker images -a -q)
