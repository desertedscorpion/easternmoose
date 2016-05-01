#!/bin/bash

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    docker run --interactive --tty freakygamma/easternmoose is-enabled dnf-makecache.timer &&
    if [[ "disabled" == $(docker run --interactive --tty freakygamma/easternmoose systemctl is-enabled dnf-makecache.timer || true) ]]
    then
	echo dnf-makecache.timer is disabled &&
	    true
    else
	echo dnf-makecache.timer is not disabled &&
	    exit 64
    fi &&
    docker rmi ninthgrimmercury/easternmoose &&
    docker rmi freakygamma/easternmoose &&
    true
