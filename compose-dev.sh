#!/bin/bash

# get action arg
override_file=$1
action=$2
while [[ ! -z $action ]] && getopts a:f flag
do
    case "${flag}" in
        a) action=${OPTARG};;
        f) file=${OPTARG};;
    esac
done

# docker compose
if [[ $action == "down" ]] && [[ ! -z $override_file ]]; then
    docker-compose -f ./docker-compose.yaml -f ./$override_file -p deploy_giftshop down
elif [[ $action == "up" ]] && [[ ! -z $override_file ]]; then
    docker-compose -f ./docker-compose.yaml -f ./$override_file -p deploy_giftshop up -d --remove-orphans
fi