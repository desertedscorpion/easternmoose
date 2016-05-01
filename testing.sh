#!/bin/bash

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    docker run --interactive --tty freakygamma/easternmoose dnf update --assumeyes | grep "^Last metadata expiration check: 0:00:\d\d ago on ... ...  \d \d*:\d*:\d* \d\d\d\d.\$" &&
    if [[ "disabled" == "$(docker run --interactive freakygamma/easternmoose systemctl is-enabled dnf-makecache.timer)" ]]
    then
	echo dnf-makecache.timer is disabled. &&
	    true
    else
	echo dnf-makecache.timer is not disabled. &&
	    exit 64 &&
	    true
    fi &&
    docker rmi --force ninthgrimmercury/easternmoose &&
    docker rmi --force freakygamma/easternmoose &&
    true
