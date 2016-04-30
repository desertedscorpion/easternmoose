#!/bin/bash

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
#    docker run --interactive --tty freakygamma/easternmoose [[ "wrong" == is-enabled dnf-makecache.timer ]] &&
    docker run --interactive --tty freakygamma/easternmoose systemctl is-enabled dnf-makecache.timer &&
    [[ "wrong" == $(docker run --interactive --tty freakygamma/easternmoose systemctl -
    docker rmi ninthgrimmercury/easternmoose &&
    docker rmi freakygamma/easternmoose &&
    true
