#!/bin/bash

docker container rm -f apache > /dev/null 2>&1 || {
    echo "Error while removing existing container."
    exit 1
}

bash -c "docker run -d \
        --restart always \
        --name apache \
        -p 80:80 \
        -v "$PWD":/var/www/html \
        -v "$PWD"/000-default.conf:/etc/apache2/sites-available/000-default.conf \
        apache" || {
    echo "Error while running container."
    exit 2
}