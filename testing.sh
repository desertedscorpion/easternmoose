#!/bin/bash

docker build -t ninthgrimmercury/easternmoose . &&
    docker build -t freakygamma/easternmoose test &&
    docker run --interactive --tty freakygamma/easternmoose test rm /tmp/no/such/file &&
    docker rmi ninthgrimmercury/easternmoose &&
    docker rmi freakygamma/easternmoose &&
    true
