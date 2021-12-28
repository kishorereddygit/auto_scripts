#!/usr/bin/env bash
cd ~/chip-certification-tool/
docker-compose down
./scripts/build-no-cache.sh
cd backend/
./scripts/build_managed_docker_images.sh
cd ..
docker-compose up