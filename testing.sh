#!/bin/bash

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    if docker run --interactive freakygamma/easternmoose dnf update --assumeyes | grep "^Last metadata expiration check: 0:0"
    then
	echo dnf was updated within the last ten minutes &&
	    true
    else
	echo dnf was not updated within the last ten minutes &&
	    exit 64 &&
	    true
    fi &&
    if [[ "disabled" == "$(docker run --interactive freakygamma/easternmoose systemctl is-enabled dnf-makecache.timer)" ]]
    then
	echo dnf-makecache.timer is disabled. &&
	    true
    else
	echo dnf-makecache.timer is not disabled. &&
	    exit 65 &&
	    true
    fi &&
    docker rmi --force ninthgrimmercury/easternmoose &&
    docker rmi --force freakygamma/easternmoose &&
    true
