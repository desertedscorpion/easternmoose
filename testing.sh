#!/bin/bash

function is-enabled(){
    docker run --interactive --tty freakygamma/easternmoose systemctl is-enabled dnf-makecache.timer;
    return 0
}

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    if [[ "disabled" == "$(is-enabled dnf-makecache.timer)" ]]
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
