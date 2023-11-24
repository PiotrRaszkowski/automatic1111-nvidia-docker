#!/usr/bin/env bash
docker rm automatic1111-nvidia-docker

docker run -d -p 7860:7860 --gpus 'all,capabilities=utility' -e USE_CUDA_118=false -e USE_CUDA_121=true -e USE_XFORMERS=true --name automatic1111-nvidia-docker piotrraszkowski/automatic1111-nvidia-docker

docker logs automatic1111-nvidia-docker -f