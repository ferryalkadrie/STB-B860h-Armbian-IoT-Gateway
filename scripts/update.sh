#!/bin/bash

echo "Updating System..."

sudo apt update

sudo apt upgrade -y

docker compose pull

docker compose up -d

docker image prune -f

echo "System Update Completed."
