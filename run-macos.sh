#!/usr/bin/env bash
docker rm automatic1111-nvidia-docker

docker run -d -p 7860:7860 -e IS_MACOS=true --name automatic1111-nvidia-docker piotrraszkowski/automatic1111-nvidia-docker

docker logs automatic1111-nvidia-docker -f