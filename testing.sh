#!/bin/bash

docker build -t ninthgrimmercury/easternmoose . &&
    docker build -t freakygamma/easternmoose test &&
    docker run --interactive --tty freakygamma/easternmoose test false &&
    true
