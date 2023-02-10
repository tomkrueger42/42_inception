#!/bin/bash

docker build -t inception-wordpress srcs/requirements/wordpress/
docker run -it --env-file srcs/.env --expose 9000 --mount type=bind,source=$HOME/data/wordpress/content,target=/var/www/html --network inception_backend_network --name wordpress inception-wordpress
