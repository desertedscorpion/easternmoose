#!/bin/bash

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    docker run --interactive --tty freakygamma/easternmoose is-enabled dnf-makecache.timer &&
    BAD=$(docker run --interactive --tty freakygamma/easternmoose systemctl is-enabled dnf-makecache.timer || true) &&
    if [[ "disabled" == "${BAD}" ]]
    then
	echo -e "dnf-makecache.timer is disabled - \"${BAD}\"." &&
	    true
    else
	echo -e "dnf-makecache.timer is not disabled - \"${BAD}\"." &&
	    exit 64
    fi &&
    docker rmi ninthgrimmercury/easternmoose &&
    docker rmi freakygamma/easternmoose &&
    true
