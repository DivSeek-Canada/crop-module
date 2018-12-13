#!/bin/bash
echo "Deploying Divseek Canada Portal"

source .env
envsubst < "docker-compose-template.yml" > "docker-compose.yml"

docker-compose down
docker-compose build
docker-compose up
