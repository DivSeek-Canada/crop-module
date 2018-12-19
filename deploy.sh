#!/bin/bash
echo "Deploying Divseek Canada Portal"

echo "Baking a new docker-compose with environmental variables from .env"
source .env
envsubst < "docker-compose-template.yml" > "docker-compose.yml"
echo "Created docker-compose.yml"

echo "Cycling docker-compose (down->build->up)"
docker-compose down
docker-compose build
docker-compose -f docker-compose.yml up -d

echo "Use docker-compose logs to see deployment progress"
