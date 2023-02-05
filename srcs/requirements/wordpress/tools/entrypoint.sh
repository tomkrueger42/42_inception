#!/bin/bash

# if this script starts too soon just let it sleep for a few seconds

cd /var/www/html
wp core download --allow-root

cp /wp-config.php /var/www/html/
wp core install --allow-root --url=$URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL
mkdir /run/php

cd /
php-fpm7.3 --nodaemonize