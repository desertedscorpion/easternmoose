#!/bin/bash

docker build -t ninthgrimmercury/easternmoose . &&
    docker build -t freakygamma/easternmoose test &&
    docker run --interactive --tty freakygamma/easternmoose systemctl [[ "wrong" == is-enabled dnf-makecache.timer ]] &&
    docker rmi ninthgrimmercury/easternmoose &&
    docker rmi freakygamma/easternmoose &&
    true
