#!/bin/bash

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    DNFUPDATEFILE=$(mktemp) &&
    docker run --interactive --tty freakygamma/easternmoose dnf update --assumeyes > ${DNFUPDATEFILE} 2>&1 &&
    echo ${DNFUPDATEFILE} &&
    if [[ "disabled" == "$(docker run --interactive freakygamma/easternmoose systemctl is-enabled dnf-makecache.timer)" ]]
    then
	echo dnf-makecache.timer is disabled. &&
	    true
    else
	echo dnf-makecache.timer is not disabled. &&
	    exit 64
    fi &&
    docker rmi --force ninthgrimmercury/easternmoose &&
    docker rmi --force freakygamma/easternmoose &&
    true
