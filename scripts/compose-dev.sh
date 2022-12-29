#!/bin/bash

# moving root dir
cd ..

# get action arg
action=$1
while [[ ! -z $action ]] && getopts a flag
do
    case "${flag}" in
        a) action=${OPTARG}
    esac
done

# docker compose
if [[ $action == "down" ]]; then
    docker-compose -f docker-compose.yaml -f docker-compose.dev.override.yaml -p deploy_giftshop down
elif [[ $action == "up" ]]; then
    docker-compose -f docker-compose.yaml -f docker-compose.dev.override.yaml -p deploy_giftshop up -d --remove-orphans
fi