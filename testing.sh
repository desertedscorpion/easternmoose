#!/bin/bash

function is-enabled(){
    ( docker run --interactive --tty freakygamma/easternmoose systemctl is-enabled "${@}" || true) &&
    return 0
}

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    is-enabled dnf-makecache.timer &&
    if [[ "disabled" == "$(is-enabled dnf-makecache.timer)" ]]
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
