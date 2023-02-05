#!/bin/bash

GREEN='\033[1;34m'
NC='\033[0m'

echo -e "${GREEN}Docker Containers:${NC}"
docker ps -a

echo -e "\n${GREEN}Docker Networks:${NC}"
docker network ls

echo -e "\n${GREEN}Docker Volumes:${NC}"
docker volume ls

echo -e "\n${GREEN}Docker Images:${NC}"
docker images
