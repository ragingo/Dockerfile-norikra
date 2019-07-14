#!/bin/bash

# docker build --rm -f ./Dockerfile -t ragingo/norikra:latest .

docker-compose -f ./docker-compose.yml up -d --build
