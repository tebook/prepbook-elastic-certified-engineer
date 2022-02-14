#!/bin/bash

sudo /usr/local/bin/docker-compose -f cluster01.yml -p cluster01 up -d --remove-orphans
sudo /usr/local/bin/docker-compose -f cluster02.yml -p cluster02 up -d --remove-orphans
