#!/bin/bash

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    if [[ "disabled" == "$(docker run --interactive freakygamma/easternmoose systemctl is-enabled dnf-makecache.timer)" ]]
    then
	echo dnf-makecache.timer is disabled. &&
	    true
    else
	echo dnf-makecache.timer is not disabled. &&
	    exit 64
    fi &&
    docker rmi ninthgrimmercury/easternmoose &&
    docker rmi freakygamma/easternmoose &&
    true
