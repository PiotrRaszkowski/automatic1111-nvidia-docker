#!/usr/bin/env bash
docker build -t piotrraszkowski/automatic1111-nvidia-docker .

docker image ls

docker run -d -p 7860:7860 --name automatic1111-nvidia-docker piotrraszkowski/automatic1111-nvidia-docker