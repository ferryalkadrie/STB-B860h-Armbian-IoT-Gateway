#!/bin/bash

echo "Starting Restore..."

docker stop homeassistant
docker stop nodered
docker stop mosquitto

echo "Restore backup files manually if required."

docker start mosquitto
docker start nodered
docker start homeassistant

echo "Restore Completed."
