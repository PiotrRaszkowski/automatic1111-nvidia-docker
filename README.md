# Installation guide



## Ubuntu Server with Nvidia

### Prerequisites
1. x86_64 architecture
1. Ubuntu 22.04 Server Installed.
1. Nvidia Graphics Card (tested on 1060 6GB VRam).

### Installation
1. Install Docker on your host machine: https://docs.docker.com/engine/install/ubuntu/.
1. Install CUDA and Nvidia drivers on your host machine: https://www.cherryservers.com/blog/install-cuda-ubuntu.
    1. Tested and optimized for CUDA 12.2.
    1. Tested with Nvidia Drivers version 535.
1. Clone this repository.
1. Run `./build-x86_64.sh`. It will take a while.
1. Run `docker compose -f docker-compose.x64.yml up -d`.

Automatic1111 should be available: http://127.0.0.1:7860

Build and run take a while... depending on your network speed, at the end you will have:
- Docker Image created.
- Docker container running with dedicated volume.
- Automatic1111 installed to the dedicated volume and accesible from your network.

## Ubuntu Server with Nvidia

### Prerequisites
1. MacOS with arm64 (Apple Silicon) architecture.
1. Homebrew installed.

### Installation
1. Install OrbStack (best Docker replacement) or standard Docker.
1. Clone this repository.
1. Run `./build-arm64.sh`. It will take a while.
1. Run `docker compose -f docker-compose.macos.yml up -d`.

Automatic1111 should be available: http://127.0.0.1:7860