#!/bin/bash

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    docker run --interactive --tty freakygamma/easternmoose is-enabled dnf-makecache.timer &&
    [[ "disabled" == $(docker run --interactive --tty freakygamma/easternmoose systemctl is-enabled dnf-makecache.timer) ]]
    echo PASSED &&
    docker rmi ninthgrimmercury/easternmoose &&
    docker rmi freakygamma/easternmoose &&
    true
