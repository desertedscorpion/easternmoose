#!/bin/bash

time docker build -t ninthgrimmercury/easternmoose . &&
    time docker build -t freakygamma/easternmoose test &&
    docker run --interactive --tty freakygamma/easternmoose [[ "wrong" == is-enabled dnf-makecache.timer ]] &&
    docker rmi ninthgrimmercury/easternmoose &&
    docker rmi freakygamma/easternmoose &&
    true
