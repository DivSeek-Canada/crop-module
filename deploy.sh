#!/bin/bash
echo "Deploying Divseek Canada Portal"

echo "Baking a new docker-compose with environmental variables from .env"
source .env
envsubst < "docker-compose_templates/docker-compose-template.yml" > "docker-compose.yml"
echo "Created docker-compose.yml"

echo "Cycling docker-compose (down->build->up)"
docker-compose down
docker-compose build
# The recommended sequence of system startup involves 
# a specific sequence of container startup and slight delays
echo "Use docker-compose logs in a separate screen or session to see deployment progress"
echo "Starting up the databases"
docker-compose up -d apollo_db tripal_db
sleep 30s
echo "Staring up Tripal"
docker-compose up -d tripal
sleep 5m
echo "Starting up the remainder of the system including the proxy"
docker-compose up -d

