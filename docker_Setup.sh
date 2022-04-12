#!/usr/bin/env bash

cd /home/ubuntu/chip-certification-tool/
docker-compose down
./scripts/build-no-cache.sh
cd backend/
./scripts/build_managed_docker_images.sh
