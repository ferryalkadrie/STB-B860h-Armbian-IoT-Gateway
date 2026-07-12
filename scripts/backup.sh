#!/bin/bash

echo "Starting Backup..."

mkdir -p backup

docker stop homeassistant
docker stop nodered
docker stop mosquitto

tar -czf backup/homeassistant.tar.gz /var/lib/docker/volumes/homeassistant_data

tar -czf backup/nodered.tar.gz /var/lib/docker/volumes/node_red_data

tar -czf backup/mosquitto.tar.gz /var/lib/docker/volumes/mosquitto_data

docker start mosquitto
docker start nodered
docker start homeassistant

echo "Backup Finished."
